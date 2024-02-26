#!/usr/bin/env bash

set -x

# default directories
dxvk_lib32=${dxvk_lib32:-"x32"}
dxvk_lib64=${dxvk_lib64:-"x64"}

# figure out where we are
basedir="$(dirname "$(readlink -f "$0")")"

# figure out which action to perform
action="$1"

case "$action" in
install)
  ;;
uninstall)
  ;;
*)
  echo "Unrecognized action: $action"
  echo "Usage: $0 [install|uninstall] [--without-dxgi] [--symlink]"
  exit 1
esac

# process arguments
shift

with_dxgi=true
file_cmd="cp -v --reflink=auto"

while (($# > 0)); do
  case "$1" in
  "--without-dxgi")
    with_dxgi=false
    ;;
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

wineserver="wineserver"
wine="wine"
wine64="wine64"
wineboot="wineboot"

# $PATH is the way for user to control where wine is located (including custom Wine versions).
# Pure 64-bit Wine (non Wow64) requires skipping 32-bit steps.
# In such case, wine64 and winebooot will be present, but wine binary will be missing,
# however it can be present in other PATHs, so it shouldn't be used, to avoid versions mixing.
wine_path=$(dirname "$(which $wineserver)")

# Thank you winetricks!
get_file_arch()
{
  _W_file="$1"
  # Assume ELF binaries for everything else
  _W_ob_output="$(od -An -t x1 -j 0x12 -N 1 "${_W_file}" | tr -d "[:space:]")"
  case "${_W_ob_output}" in
      "3e")      _W_file_arch="x86_64" ;;
      "03"|"06") _W_file_arch="i386" ;;
      "b7")      _W_file_arch="aarch64" ;;
      "28")      _W_file_arch="aarch32" ;;
      *)         _W_file_arch="" ;;
  esac

  echo "${_W_file_arch}"
}

if [ -z "$WINEARCH" ]; then
  wine_arch=$(get_file_arch "$wine_path/$wine")
  wine64_arch=$(get_file_arch "$wine_path/$wine64")
  if [ "$wine_arch" == "i386" ] && [ "$wine64_arch" == "x86_64" ]; then
    arch=win64
  elif [ "$wine_arch" == "x86_64" ]; then
    arch=win64
  elif [ "$wine_arch" == "i386" ] && [ "$wine64_arch" == "" ]; then
    arch=win32
  fi
else
  arch="$WINEARCH"
fi

if ! [ -f "$wine_path/$wine64" ]; then
   wine64="$wine_path/$wine"
fi

if [ "$arch" == "win32" ]; then
  wine64="$wine"
fi

# resolve 32-bit and 64-bit system32 path
winever="$($wineserver --version 2>&1 >/dev/null | grep Wine)"
if [ -z "$winever" ]; then
  echo "$wineserver:"' Not a wine executable. Check your $wine.' >&2
  exit 1
fi

# ensure wine placeholder dlls are recreated
# if they are missing
$wineboot -u

system32_path=$($wine64 winepath.exe -u 'C:\windows\system32' 2> /dev/null)
system32_path="${system32_path/$'\r'/}"
syswow64_path=$($wine64 winepath.exe -u 'C:\windows\syswow64' 2> /dev/null)
syswow64_path="${syswow64_path/$'\r'/}"

if [ -z "$syswow64_path" ] && [ -z "$system32_path" ]; then
  echo 'Failed to resolve C:\windows\system32.' >&2
  exit 1
fi

# create native dll override
overrideDll() {
  if ! $wine64 reg add 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v "$1" /d native /f >/dev/null 2>&1; then
    echo -e "Failed to add override for $1"
    exit 1
  fi
}

# remove dll override
restoreDll() {
  if ! $wine64 reg delete 'HKEY_CURRENT_USER\Software\Wine\DllOverrides' /v "$1" /f > /dev/null 2>&1; then
    echo "Failed to remove override for $1"
  fi
}

# copy or link dxvk dll, back up original file
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

# remove dxvk dll, restore original file
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
  if [ "$arch" == "win32" ]; then
    installFile "$system32_path" "$dxvk_lib32" "$1"
    inst64_ret="$?"
  else
    installFile "$system32_path" "$dxvk_lib64" "$1"
    inst64_ret="$?"
  fi

  inst32_ret=-1
  if [ -d "$syswow64_path" ]; then
    installFile "$syswow64_path" "$dxvk_lib32" "$1"
    inst32_ret="$?"
  fi

  if (( (inst32_ret == 0) || (inst64_ret == 0) )); then
    overrideDll "$1"
  fi
}

uninstall() {
  if [ "$arch" == "win32" ]; then
    uninstallFile "$system32_path" "$dxvk_lib32" "$1"
    uninst64_ret="$?"
  else
    uninstallFile "$system32_path" "$dxvk_lib64" "$1"
    inst64_ret="$?"
  fi

  uninst32_ret=-1
  if [ -d "$syswow64_path" ]; then
    uninstallFile "$syswow64_path" "$dxvk_lib32" "$1"
    uninst32_ret="$?"
  fi

  if (( (uninst32_ret == 0) || (uninst64_ret == 0) )); then
    restoreDll "$1"
  fi
}

# skip dxgi during install if not explicitly
# enabled, but always try to uninstall it
if $with_dxgi || [ "$action" == "uninstall" ]; then
  $action dxgi
fi

$action d3d9
$action d3d10core
$action d3d11
