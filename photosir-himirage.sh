#!/bin/bash 
APPDIR=/opt/photosir-himirage
if [ ! -f "${APPDIR}/appdata.tar.gz" ];then
  echo "not found"
else
if [ ! -d "${HOME}/appdata/himirage" ];then
    mkdir -p "${HOME}/appdata"
    touch "${HOME}/appdata/20220823.txt"
    tar -xvf  "${APPDIR}/appdata.tar.gz" -C "${HOME}"
elif [ ! -f "${HOME}/appdata/20220823.txt" ];then
    mkdir -p "${HOME}/appdata"
    touch "${HOME}/appdata/20220823.txt"
    tar -xf  "${APPDIR}/appdata.tar.gz" -C "${HOME}"
fi
export QML2_IMPORT_PATH="${APPDIR}/qml:${QML2_IMPORT_PATH}"
export QT_PLUGIN_PATH="${APPDIR}/plugins:${QT_PLUGIN_PATH}"
export PATH="${APPDIR}:${APPDIR}/files:${PATH}"
export LD_LIBRARY_PATH="${APPDIR}/lib/qt:${APPDIR}/lib/yixin:${LD_LIBRARY_PATH}"
if [ `id -u` -eq 0 ];then
	echo "You are a super admin"
	env QTWEBENGINE_DISABLE_SANDBOX=1 exec "${APPDIR}/himirage" %F "$@"
    else
	    echo "You are a common user"
	    exec "${APPDIR}/himirage" %F "$@"
    fi
fi