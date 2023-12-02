#!/usr/bin/env bash

basedir="$(dirname "$(readlink -f "$0")")"
dlls=(dxgi.dll d3d9.dll d3d10core.dll d3d11.dll)
dxvk_lib32_path="$basedir/x32"
dxvk_lib64_path="$basedir/x64"

proton_dxvkpath=(/usr/share/steam/compatibilitytools.d/**/files/{lib,lib64}/wine/dxvk)

function pe64_or_not {
    if ! exepa=$(realpath -es "$1" 2>/dev/null); then
        echo "Path '$1' not exists"
        exit 20
    else
        case $(file -L "$exepa") in
            *PE32*x86-64*)
                echo 64 ;;
            *PE32*80386*)
                return ;;
            *)
                echo "Not a supported executable"
                exit 21 ;;
        esac
    fi
}

function InstallFile {
  path=$1
  file_name=$2

  dstfile="$path/$file_name"

  if [[ $(pe64_or_not "$dstfile") = 64 ]]; then
    srcfile="$dxvk_lib64_path/$file_name"
  else
    srcfile="$dxvk_lib32_path/$file_name"
  fi

  if ! [ -f "$(realpath "${dstfile}")" ]; then
    echo "${dstfile}: File not found. Skipping." >&2
    return 1
  fi

  if ! [[ -f $(realpath "${dstfile}.old") ]]; then
    mv "$dstfile" "${dstfile}.old"
    echo "${dstfile}: Backed up."
  else
    rm -f "$dstfile"
  fi

  $file_cmd "$srcfile" "$dstfile"
}

function RestoreFile {
  path=$1
  file_name=$2

  dstfile="$path/$file_name"

  if ! [[ -f $(realpath "$dstfile") ]]; then
    echo "${dstfile}: File not found. Skipping." >&2
    return 1
  elif ! [[ -f $(realpath "${dstfile}.old") ]]; then
    echo "${dstfile}: File backup not found. Skipping." >&2
    return 1
  fi

  mv -f "${dstfile}.old" "$dstfile"
  echo "${dstfile}: Restored."
}

if [ "$(id -u)" != "0" ]; then
        echo "You need run this script as root!"
        exit 1
fi

# figure out which action to perform
action="$1"

case "$action" in
install)
  ;;
restore)
  ;;
*)
  echo "Unrecognized action: $action"
  echo "Usage: $0 [install|restore] [--symlink]"
  exit 1
esac

# process arguments
shift

file_cmd="cp -v --reflink=auto"

while (($# > 0)); do
  case "$1" in
  "--symlink")
    file_cmd="ln -s -v"
    ;;
  esac
  shift
done

for dir in "${proton_dxvkpath[@]}"; do
  if [[ -d $dir ]]; then
    dxvkpath+=("$dir")
  fi
done

if [[ -n ${dxvkpath[*]} ]]; then
  printf '%s\n' "${dxvkpath[@]}"
  echo 'Do you wish to change the above dxvk?'
  PS3="Enter a number: "
  select yn in "Yes" "No"; do
    case $yn in
      Yes) echo; break;;
      No ) exit;;
      *  ) echo -e '\nInvalid input'; exit 1;;
    esac
  done
else
    echo 'No proton installed in "/usr/share/steam/compatibilitytools.d"'
    exit 1
fi

install() {
  file_name=$1

  for path in "${dxvkpath[@]}"; do
    InstallFile "$path" "$file_name"
  done
}

restore() {
  file_name=$1
  
  for path in "${dxvkpath[@]}"; do
    RestoreFile "$path" "$file_name"
  done
}

for dll in "${dlls[@]}"; do
  $action "$dll"
done
