#!/bin/sh
set -e
XDG_DATA_HOME="/var/tmp"
_APPNAME=@appname@
_APPDIR="/opt/${_APPNAME}"
_RUNNAME="${_APPDIR}/@runname@"
_env_user_data="${XDG_DATA_HOME}"
if [ -z "${_env_user_data}" ] ; then
    _env_user_data="${HOME}"
fi
if [ -z "${_env_user_data}" ] ; then
    _env_user_data="/var/tmp"             
fi
export _env_user_data="${_env_user_data}/${_APPNAME}"
_input_method_framework=fcitx
is_exist_fcitx=`ps -ef | grep [f]citx`
if [ -z "${is_exist_fcitx}" ] ; then
	_input_method_framework=ibus
fi
export XMODIFIERS="@im=${_input_method_framework}"
export XIM="${_input_method_framework}"
export XIM_PROGRAM="${_input_method_framework}"
export GTK_IM_MODULE="${_input_method_framework}"
export QT_IM_MODULE="${_input_method_framework}"
export QT_QPA_PLATFORM=xcb
export QT_QPA_PLATFORM_PLUGIN_PATH="${_APPDIR}/qtplugins:${QT_QPA_PLATFORM_PLUGIN_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/qtplugins:${QT_PLUGIN_PATH}"
export QT_DEBUG_PLUGINS=1
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${_APPDIR}:${_APPDIR}/drivers:${_APPDIR}/systemlibs:${_APPDIR}/language"
export DOTNET_ROOT="${_APPDIR}/dotnet:${DOTNET_ROOT}"
export PATH="${PATH}:${DOTNET_ROOT}"
_display_server_type=`echo ${WAYLAND_DISPLAY}`
if [ "${_display_server_type}" = "*wayland*" ]; then
	export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${_APPDIR}/systemlibs/wayland"
fi
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?