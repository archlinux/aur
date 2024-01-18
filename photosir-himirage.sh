#!/bin/bash 
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
if [ ! -f "${_APPDIR}/appdata.tar.gz" ];then
  echo "not found"
else
if [ ! -d "${_APPDIR}/appdata/@runname@" ];then
    mkdir -p "${_APPDIR}/appdata"
    touch "${_APPDIR}/appdata/20220823.txt"
    tar -xvf  "${_APPDIR}/appdata.tar.gz" -C "${_APPDIR}"
elif [ ! -f "${_APPDIR}/appdata/20220823.txt" ];then
    mkdir -p "${_APPDIR}/appdata"
    touch "${_APPDIR}/appdata/20220823.txt"
    tar -xf  "${_APPDIR}/appdata.tar.gz" -C "${_APPDIR}"
fi
export PATH="${_APPDIR}:${_APPDIR}/files:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib/qt:${_APPDIR}/lib/yixin:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:${QT_PLUGIN_PATH}"
export QML_IMPORT_PATH="${_APPDIR}/qml:${QML_IMPORT_PATH}"
export QML2_IMPORT_PATH="${_APPDIR}/qml:${QML2_IMPORT_PATH}"
if [ `id -u` -eq 0 ];then
	echo "You are a super admin"
	env QTWEBENGINE_DISABLE_SANDBOX=1 exec "${_APPDIR}/@runname@" "$@" || exit $?
    else
	    echo "You are a common user"
        cd "${_APPDIR}"
	    exec "${_RUNNAME}" "$@" || exit $?
    fi
fi