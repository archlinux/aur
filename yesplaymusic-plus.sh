#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@" # 应用程序的安装目录
_RUNNAME="${_APPDIR}/@runname@" # 应用程序的主可执行文件路径
_CFGDIR="@cfgdirname@/" # 配置目录名
_OPTIONS="@options@" # 额外的启动选项，默认为空

# 设置环境变量
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"

# 设置 Electron 的环境变量以禁用开发者警告和其他安全警告:
export ELECTRON_IS_DEV=0 
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true

# 指定 Electron 二进制文件的路径
export ELECTRON_OVERRIDE_DIST_PATH="/usr/bin/electron@electronversion@" 

# 设置为生产环境
export NODE_ENV=production 

# 配置文件的主目录
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# 用户标志配置文件的路径
export _FLAGS_FILE="${XDG_CONFIG_HOME}/${_CFGDIR}@appname@-flags.conf"

# 读取用户配置文件 _FLAGS_FILE
declare -a _USER_FLAGS
if [[ -f "${_FLAGS_FILE}" ]]; then
    while read -r line; do
        if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
            _USER_FLAGS+=("${line}")
        fi
    done < "${_FLAGS_FILE}"
fi
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }


if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    # 非root用户，或环境变量ELECTRON_RUN_AS_NODE被设置，则直接启动应用
    exec electron@electronversion@ "${_RUNNAME}" ${_OPTIONS} "${_USER_FLAGS[@]}" "$@"
else
    # 确保root身份下 Electron 在无沙箱模式下运行
    exec electron@electronversion@ "${_RUNNAME}" ${_OPTIONS} --no-sandbox "${_USER_FLAGS[@]}" "$@"
fi