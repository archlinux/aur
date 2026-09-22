#!/bin/bash
# aTrust 托盘启动器: 确保核心服务运行后启动托盘
SVC=aTrustDaemon.service
if ! systemctl is-active --quiet "$SVC"; then
    pkexec systemctl start "$SVC" || true
    sleep 2
fi
APP=/usr/share/sangfor/aTrust
export LD_LIBRARY_PATH="$APP/uem/bin:$APP/uem/lib:$APP/resources/bin:$APP/resources/lib:$APP${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export NODE_ENV=production
cd "$APP"
exec "$APP/aTrustTray" --no-sandbox --disable-gpu "$@"
