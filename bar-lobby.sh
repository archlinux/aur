#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_OPTIONS="@options@"
export APPIMAGE="@appimgname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export ELECTRON_DISABLE_SECURITY_WARNINGS=true
export NODE_ENV=production
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

## Symlinking Spring engine(s) installed with a package manager
# Create the engine folder if it doesn't exist
echo -e "\e[1;34m==> Checking if \e[1;32m$HOME/.local/share/BeyondAllReason/assets/engine/\e[0m \e[1;34mexists...\e[0m"
if [[ -d "$HOME/.local/share/BeyondAllReason/assets/engine/" ]]; then
    echo -e "\e[1;32m✔️  \e[1;33mDirectory already exists.\e[0m"
else
    echo -e "\e[1;31m✖️  \e[1;34mDirectory did not exist; creating it now...\e[0m"
    mkdir -p "$HOME/.local/share/BeyondAllReason/assets/engine/"
fi


# Loop through each directory in the source path

# Check if /usr/share/recoil-engine/ exists and if it contains any folders
if [ ! -d "/usr/share/recoil-engine/" ] || [ -z "$(find /usr/share/recoil-engine/ -mindepth 1 -type d)" ]; then
    echo -e "\e[1;32mINFO:\e[0m \e[1;33mNo local engines found.\e[0m"
else
    echo -e "\e[1;32mINFO:\e[0m \e[1;33mSymLinking engines found in \`/usr/share/recoil-engine/*\`.\e[0m"
    for dir in /usr/share/recoil-engine/*; do
#        echo "=============================== In linking loop =============================="  # For debug only
        if [ -d "$dir" ]; then
            # Get the base name of the directory
            folder_name=$(basename "$dir")
            link_target="$HOME/.local/share/BeyondAllReason/assets/engine/$folder_name"

            # Check if a link or directory already exists
            if [ -e "$link_target" ]; then
                echo "Link or directory already exists: $link_target — skipping"
            else
                # Create the symbolic link
                ln -s "$dir" "$link_target"
                echo "Created link: $link_target"
            fi
        fi
    done
fi

# Check for broken links and delete them
for link in "$HOME/.local/share/BeyondAllReason/assets/engine/"*; do
    if [ ! -e "$link" ]; then
        rm "$link"
        echo "Deleted broken link: $link"
    fi
done
## End of symlinking engine


_FLAGS_FILE="${XDG_CONFIG_HOME}/@appname@-flags.conf"
declare -a flags
if [[ -f "${_FLAGS_FILE}" ]]; then
    mapfile -t < "${_FLAGS_FILE}"
fi
for line in "${MAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        flags+=("${line}")
    fi
done
_WAYLAND_OPTION=false
for arg in "$@"; do
    if [[ "${arg}" == "--wayland" ]]; then
        _WAYLAND_OPTION=true
        break
    fi
done
if [[ "${_WAYLAND_OPTION}" == true ]]; then
    echo "Forcing Wayland"
    flags+=("--enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL" "--ozone-platform=wayland")
fi
cd "${_APPDIR}"
if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    exec electron@electronversion@  "${_RUNNAME}" "${_OPTIONS}" "${flags[@]}" "$@" || exit $?
else
    exec electron@electronversion@  "${_RUNNAME}" "${_OPTIONS}" --no-sandbox "${flags[@]}" "$@" || exit $?
fi
