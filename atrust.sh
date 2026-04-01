#!/bin/bash
set -o pipefail
# 服务名称定义，方便后续维护
SERVICE_NAME="aTrustDaemon.service"
# 程序启动前：确保服务运行（未运行则启动）
if ! systemctl is-active --quiet "${SERVICE_NAME}"; then
    echo "[INFO] 服务 ${SERVICE_NAME} 未运行，正在启动..."
    if ! systemctl start "${SERVICE_NAME}"; then
        echo "[ERROR] 启动服务 ${SERVICE_NAME} 失败，脚本终止"
        exit 1
    fi
    echo "[INFO] 服务 ${SERVICE_NAME} 启动成功"
    sleep 3
else
    echo "[INFO] 服务 ${SERVICE_NAME} 已处于运行状态"
fi
_APPDIR=/usr/share/@appname@/@runpath@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/uem/bin:${_APPDIR}/uem/lib:${_APPDIR}/resources/bin:${_APPDIR}/resources/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export NODE_ENV=production
cd "${_APPDIR}"
# 执行目标程序（替换exec，确保程序退出后能执行后续停止服务逻辑）
"${_RUNNAME}" --no-sandbox --disable-gpu "$@"
# 保存程序退出码，用于后续传递
PROGRAM_EXIT_CODE=$?
# 程序退出后：停止服务
echo "[INFO] 目标程序已退出（退出码：$PROGRAM_EXIT_CODE），正在停止服务 ${SERVICE_NAME}..."
if systemctl stop "${SERVICE_NAME}"; then
    echo "[INFO] 服务 ${SERVICE_NAME} 停止成功"
else
    echo "[WARNING] 停止服务 ${SERVICE_NAME} 失败，请手动检查"
fi
# 传递目标程序的退出码，保证脚本退出状态与目标程序一致
exit "${PROGRAM_EXIT_CODE}"