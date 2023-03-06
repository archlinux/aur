#!/usr/bin/env bash

# default directories
dxvk_nvapi_lib32=${dxvk_nvapi_lib32:-"x32"}
dxvk_nvapi_lib64=${dxvk_nvapi_lib64:-"x64"}

# figure out where we are
basedir=$(dirname "$(readlink -f "$0")")

# figure out which action to perform
action="$1"

case "$action" in
install)
  ;;
uninstall)
  ;;
*)
  echo "Unrecognized action: $action"
  echo "Usage: $0 [install|uninstall] [--symlink]"
  exit 1
esac

# process arguments
shift

file_cmd="cp -v"

while (($# > 0)); do
  case "$1" in
  "--symlink")
    file_cmd="ln -s -v"
    ;;
  esac
  shift
done

# check wine prefix before invoking wine, so that we
# don't accidentally create one if the user screws up
if [ -n "$WINEPREFIX" ] && ! [ -f "$WINEPREFIX/system.reg" ]; then
  echo "$WINEPREFIX:"' Not a valid wine prefix.' >&2
  exit 1
fi

# find wine executable
export WINEDEBUG=-all
# disable mscoree and mshtml to avoid downloading
# wine gecko and mono
export WINEDLLOVERRIDES="mscoree,mshtml="

wine="wine"
wine64="wine64"
wineboot="wineboot"

# $PATH is the way for user to control where wine is located (including custom Wine versions).
# Pure 64-bit Wine (non Wow64) requries skipping 32-bit steps.
# In such case, wine64 and winebooot will be present, but wine binary will be missing,
# however it can be present in other PATHs, so it shouldn't be used, to avoid versions mixing.
wine_path=$(dirname "$(which $wineboot)")
wow64=true
if ! [ -f "$wine_path/$wine" ]; then
   wine=$wine64
   wow64=false
fi

# resolve 32-bit and 64-bit system32 path
winever=$($wine --version | grep wine)
if [ -z "$winever" ]; then
    echo "$wine: Not a wine executable. Check your $wine." >&2
    exit 1
fi

# ensure wine placeholder dlls are recreated
# if they are missing
$wineboot -u

win64_sys_path=$($wine64 winepath -u 'C:\windows\system32' 2> /dev/null)
win64_sys_path="${win64_sys_path/$'\r'/}"
if $wow64; then
  win32_sys_path=$($wine winepath -u 'C:\windows\system32' 2> /dev/null)
  win32_sys_path="${win32_sys_path/$'\r'/}"
fi

if [ -z "$win32_sys_path" ] && [ -z "$win64_sys_path" ]; then
  echo 'Failed to resolve C:\windows\system32.' >&2
  exit 1
fi

# create native dll override
overrideDll() {
  if ! $wine reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v "$1" /d native /f >/dev/null 2>&1
  then
    echo -e "Failed to add override for $1"
    exit 1
  fi
}

# remove dll override
restoreDll() {
  if ! $wine reg delete 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v "$1" /f > /dev/null 2>&1
  then
    echo "Failed to remove override for $1"
  fi
}

# copy or link dxvk_nvapi dll, back up original file
installFile() {
  dstfile="${1}/${3}.dll"
  srcfile="${basedir}/${2}/${3}.dll"

  if ! [ -f "${srcfile}" ]; then
    echo "${srcfile}: File not found. Skipping." >&2
    return 1
  fi

  if [ -n "$1" ]; then
    if [ -f "${dstfile}" ] || [ -h "${dstfile}" ]; then
      if ! [ -f "${dstfile}.old" ]; then
        mv -v "${dstfile}" "${dstfile}.old"
      else
        rm -v "${dstfile}"
      fi
    else
      touch "${dstfile}.old_none"
    fi
    $file_cmd "${srcfile}" "${dstfile}"
  fi
  return 0
}

# remove dxvk_nvapi dll, restore original file
uninstallFile() {
  dstfile="${1}/${3}.dll"
  srcfile="${basedir}/${2}/${3}.dll"

  if ! [ -f "${srcfile}" ]; then
    echo "${srcfile}: File not found. Skipping." >&2
    return 1
  fi

  if ! [ -f "${dstfile}" ] && ! [ -h "${dstfile}" ]; then
    echo "${dstfile}: File not found. Skipping." >&2
    return 1
  fi

  if [ -f "${dstfile}.old" ]; then
    rm -v "${dstfile}"
    mv -v "${dstfile}.old" "${dstfile}"
    return 0
  elif [ -f "${dstfile}.old_none" ]; then
    rm -v "${dstfile}.old_none"
    rm -v "${dstfile}"
    return 0
  else
    return 1
  fi
}

install() {
  installFile "$win64_sys_path" "$dxvk_nvapi_lib64" "${1}64"
  inst64_ret="$?"
  if (( (inst64_ret == 0) )); then
    overrideDll "${1}64"
  fi

  inst32_ret=-1
  if $wow64; then
    installFile "$win32_sys_path" "$dxvk_nvapi_lib32" "$1"
    inst32_ret="$?"
    if (( (inst32_ret == 0) )); then
      overrideDll "$1"
    fi
  fi
}

uninstall() {
  uninstallFile "$win64_sys_path" "$dxvk_nvapi_lib64" "${1}64"
  uninst64_ret="$?"
  if (( (uninst64_ret == 0) )); then
    restoreDll "${1}64"
  fi
  
  uninst32_ret=-1
  if $wow64; then
    uninstallFile "$win32_sys_path" "$dxvk_nvapi_lib32" "$1"
    uninst32_ret="$?"
    if (( (uninst32_ret == 0) )); then
      restoreDll "$1"
    fi
  fi
}

$action nvapi
