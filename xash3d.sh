#!/bin/sh
. /etc/conf.d/xash3d

DEFAULT_LIBPATH=/usr/lib

if [ ! -d "$XASH3D_BASEDIR" ]; then
  echo "$XASH3D_BASEDIR not found"
  exit 1
fi

if [ ! -f "$XASH3D_BASEDIR/valve/dlls/hl_amd64.so" ]; then
  ln -sr $DEFAULT_LIBPATH/valve/dlls/hl.so "$XASH3D_BASEDIR"/valve/dlls/hl_amd64.so
  ln -sr $DEFAULT_LIBPATH/valve/cl_dlls/client.so "$XASH3D_BASEDIR"/valve/cl_dlls/client_amd64.so
fi

$DEFAULT_LIBPATH/xash3d/xash3d "$@"·
