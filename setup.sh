#!/bin/bash
# setup.sh - Script cấu hình VMK service

# --- CẤU HÌNH ---
if [ -n "$SUDO_USER" ]; then
    TARGET_USER="$SUDO_USER"
elif [ -n "$DOAS_USER" ]; then
    TARGET_USER="$DOAS_USER"
else
    TARGET_USER=$(logname 2>/dev/null || who am i | awk '{print $1}')
fi

if [ -z "$TARGET_USER" ] || [ "$TARGET_USER" == "root" ]; then
    echo "❌ LỖI: Không thể xác định user thường (non-root)."
    echo "   Nếu bạn đang dùng 'su', hãy dùng 'sudo' hoặc 'doas'."
    echo "   Hoặc chạy: TARGET_USER=<your_username> $0"
    exit 1
fi
PROXY_USER="uinput_proxy"
DATA_DIR="/home/$TARGET_USER/.vmksocket"
SERVICE_NAME="fcitx5-vmk.service"
SERVICE_FILE="/etc/systemd/system/$SERVICE_NAME"
SERVER_BIN="/usr/bin/fcitx5_vmk_server"

if [ "$EUID" -ne 0 ]; then
  echo "⚠️ Vui lòng chạy với quyền root (sudo)."
  exit 1
fi

echo "--- BẮT ĐẦU CẤU HÌNH VMK ---"

# 1. Tạo User Proxy
echo "-> Kiểm tra/Tạo user $PROXY_USER..."
id -u "$PROXY_USER" &>/dev/null || useradd -r -M -s /usr/sbin/nologin "$PROXY_USER"
usermod -aG input "$PROXY_USER"
usermod -aG "$TARGET_USER" "$PROXY_USER"

# 2. Kernel Module & Udev
echo "-> Cấu hình Uinput..."
modprobe uinput
if [ ! -f /etc/modules-load.d/uinput.conf ]; then
    echo "uinput" > /etc/modules-load.d/uinput.conf
fi
echo 'KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", MODE="0660", GROUP="input"' > /etc/udev/rules.d/99-vmk-uinput.rules
udevadm control --reload-rules && udevadm trigger

# 3. Phân quyền thư mục
echo "-> Thiết lập quyền truy cập..."
mkdir -p "$DATA_DIR"
chown "$TARGET_USER":"$TARGET_USER" "$DATA_DIR"
setfacl -m u:"$PROXY_USER":x "/home/$TARGET_USER"
setfacl -R -m u:"$PROXY_USER":rwx "$DATA_DIR"
setfacl -R -m d:u:"$PROXY_USER":rwx "$DATA_DIR"
setfacl -R -m u:"$TARGET_USER":rwx "$DATA_DIR"

# 4. Tạo Systemd Service
echo "-> Tạo file service..."
cat << EOF > "$SERVICE_FILE"
[Unit]
Description=Fcitx5 VMK Input Server
After=network.target multi-user.target udev.target

[Service]
User=$PROXY_USER
Group=input
Type=simple
Environment=HOME=/home/$TARGET_USER
Environment=DATA_DIR=$DATA_DIR

# Chờ 1 chút để đảm bảo file socket cũ đã xóa
ExecStartPre=/usr/bin/sleep 0.5
ExecStart=$SERVER_BIN -u $TARGET_USER

# Cấp lại quyền cho socket ngay sau khi nó được tạo ra
ExecStartPost=/bin/sh -c "/bin/sleep 0.5 && /usr/bin/setfacl -m u:$TARGET_USER:rw,m:rwx $DATA_DIR/kb_socket $DATA_DIR/.mouse_flag || true"

Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF

# 5. Kích hoạt
echo "-> Kích hoạt dịch vụ..."
systemctl daemon-reload
systemctl enable "$SERVICE_NAME"
systemctl restart "$SERVICE_NAME"

echo "✅ CẤU HÌNH HOÀN TẤT!"
