#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export CHROME_WRAPPER="${_APPDIR}"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export CHROME_VERSION_EXTRA="Built from source for @@BUILD_TARGET@@"
export CHROME_HEADLESS=1
export GNOME_DISABLE_CRASH_DIALOG=SET_BY_GOOGLE_CHROME

CHROMIUM_DISTRO_FLAGS=" --enable-plugins \
                        --enable-extensions \
                        --enable-user-scripts \
                        --enable-printing"

if [ -f "${_APPDIR}/PepperFlash/libpepflashplayer.so" ] && [ -f "${_APPDIR}/PepperFlash/manifest.json" ] ; then
  CHROMIUM_FLASH_VERSION=$(grep '"version":' "${_APPDIR}/PepperFlash/manifest.json" | awk -F\" '{ print $4 }')
  CHROMIUM_FLASH_FLAGS=" --ppapi-flash-path=${_APPDIR}/PepperFlash/libpepflashplayer.so \
                         --ppapi-flash-version=${CHROMIUM_FLASH_VERSION}"
else
  CHROMIUM_FLASH_FLAGS=""
fi

XUID=`set | grep UID`
array=(${XUID//=/ })  
for var in "${array[@]}"
do
   RUID="${var}"
done
#echo $RUID
if [ "${RUID}" = "0" ];then
    exec -a "$0" "${_RUNNAME}" --no-sandbox --disable-print-preview "${CHROMIUM_DISTRO_FLAGS}" "${CHROMIUM_FLASH_FLAGS}" "$@"
else
    exec -a "$0" "${_RUNNAME}" --disable-gpu "${CHROMIUM_DISTRO_FLAGS}" "${CHROMIUM_FLASH_FLAGS}" "$@"
fi