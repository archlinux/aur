#!/bin/bash
export CHROME_WRAPPER="`readlink -f "$0"`"
HERE="/opt/htbrowser"
cd $HERE
if ! which xdg-settings &> /dev/null; then
  export PATH="$HERE:$PATH"
else
  xdg_app_dir="${XDG_DATA_HOME:-$HOME/.local/share/applications}"
  mkdir -p "$xdg_app_dir"
  [ -f "$xdg_app_dir/mimeapps.list" ] || touch "$xdg_app_dir/mimeapps.list"
fi

if [[ -n "$LD_LIBRARY_PATH" ]]; then
  LD_LIBRARY_PATH="$HERE:$HERE/lib:$LD_LIBRARY_PATH"
else
  LD_LIBRARY_PATH="$HERE:$HERE/lib"
fi

export CHROME_VERSION_EXTRA="Built from source for @@BUILD_TARGET@@"
export CHROME_HEADLESS=1

export GNOME_DISABLE_CRASH_DIALOG=SET_BY_GOOGLE_CHROME

CHROMIUM_DISTRO_FLAGS=" --enable-plugins \
                        --enable-extensions \
                        --enable-user-scripts \
                        --enable-printing"

if [ -f "$HERE/PepperFlash/libpepflashplayer.so" ] && [ -f "$HERE/PepperFlash/manifest.json" ] ; then
  CHROMIUM_FLASH_VERSION=$(grep '"version":' "$HERE/PepperFlash/manifest.json" | awk -F\" '{ print $4 }')
  CHROMIUM_FLASH_FLAGS=" --ppapi-flash-path=$HERE/PepperFlash/libpepflashplayer.so \
                         --ppapi-flash-version=$CHROMIUM_FLASH_VERSION"
else
  CHROMIUM_FLASH_FLAGS=""
fi

XUID=`set | grep UID`
array=(${XUID//=/ })  
for var in ${array[@]}
do
   RUID=$var
done
#echo $RUID
if [ $RUID = "0" ];then
    exec -a "$0" "$HERE/htbrowser" --no-sandbox --disable-print-preview $CHROMIUM_DISTRO_FLAGS $CHROMIUM_FLASH_FLAGS "$@"
else
    exec -a "$0" "$HERE/htbrowser" --disable-gpu $CHROMIUM_DISTRO_FLAGS $CHROMIUM_FLASH_FLAGS "$@"
fi