#!/bin/bash 
_APPDIR=/opt/@appname@
_APPNAME=@runappname@
if [ ! -f "${_APPDIR}/appdata.tar.gz" ];then
  echo "not found"
else
if [ ! -d "${HOME}/appdata/@runappname@" ];then
    mkdir -p "${HOME}/appdata"
    touch "${HOME}/appdata/20220823.txt"
    tar -xvf  "${_APPDIR}/appdata.tar.gz" -C "${HOME}"
elif [ ! -f "${HOME}/appdata/20220823.txt" ];then
    mkdir -p "${HOME}/appdata"
    touch "${HOME}/appdata/20220823.txt"
    tar -xf  "${_APPDIR}/appdata.tar.gz" -C "${HOME}"
fi
export QML2_IMPORT_PATH="${_APPDIR}/qml:${QML2_IMPORT_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
export PATH="${_APPDIR}:${_APPDIR}/files:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib/qt:${_APPDIR}/lib/yixin:${LD_LIBRARY_PATH}"
if [ `id -u` -eq 0 ];then
	echo "You are a super admin"
	env QTWEBENGINE_DISABLE_SANDBOX=1 exec "${_APPDIR}/@runappname@" %F "$@"
    else
	    echo "You are a common user"
	    exec "${_APPDIR}/@runappname@" %F "$@"
    fi
fi