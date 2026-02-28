#!/bin/bash
# Root-only config script for yt
CONFIG="/etc/yt.cfg"

# Root kontrolü
if [ "$EUID" -ne 0 ]; then
    echo "[yt] Hata: Bu script sadece root tarafından çalıştırılabilir."
    exit 1
fi

# Eğer config yoksa oluştur
if [ ! -f "$CONFIG" ]; then
    touch "$CONFIG"
    echo "[yt] Config dosyası oluşturuldu: $CONFIG"
fi

# İzinleri root-only yap
chmod 600 "$CONFIG"
chown root:root "$CONFIG"
echo "[yt] Config dosyası artık sadece root tarafından yazılabilir"
