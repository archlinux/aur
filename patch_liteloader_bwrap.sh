#!/bin/bash
if [ -f "/opt/QQ/electron" ]; then
    QQPath="/opt/QQ/electron"
elif [ -f "/opt/QQ/qq" ]; then 
    QQPath="/opt/QQ/qq"
else
    echo "Unable to find QQ Path, skipping gen_preload...."
    exit 0 
fi

echo "Find QQ Path at $QQPath, start to gen_preload"

mkdir -p /opt/QQ/resources/app/application/
bwrap --new-session --cap-drop ALL --unshare-user-try --unshare-pid --unshare-cgroup-try \
    --symlink usr/lib /lib \
    --symlink usr/lib64 /lib64 \
    --symlink usr/bin /bin \
    --ro-bind /usr /usr \
    --ro-bind /opt /opt \
    --dev-bind /dev /dev \
    --ro-bind /sys /sys \
    --ro-bind /etc/passwd /etc/passwd \
    --ro-bind /etc/nsswitch.conf /etc/nsswitch.conf \
    --ro-bind-try /run/systemd/userdb /run/systemd/userdb \
    --ro-bind /etc/resolv.conf /etc/resolv.conf \
    --ro-bind /etc/localtime /etc/localtime \
    --proc /proc \
    --tmpfs "/sys/devices/virtual" \
    --dev-bind /run/dbus /run/dbus \
    --dev-bind /tmp /tmp \
    --bind "/opt/QQ/resources/app/application/" /opt/QQ/resources/app/application/ \
    --ro-bind "/opt/LiteLoaderQQNT/patching/index.js" /opt/QQ/resources/app/app_launcher/index.js \
    --ro-bind "/opt/LiteLoaderQQNT/patching/gen_preload.js" /tmp/LiteLoaderQQNT/gen_preload.js \
    --setenv LITELOADERQQNT_PRELOAD "/opt/LiteLoaderQQNT/src/preload.js" \
    --setenv QQNT_PRELOADS "/opt/QQ/resources/app/application/" \
    --setenv IBUS_USE_PORTAL 1 \
    "$QQPath" --no-sandbox /opt/QQ/resources/app
