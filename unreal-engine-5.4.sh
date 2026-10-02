#! /usr/bin/bash

# Launcher for unreal-engine-src-5.4 (Unreal Engine 5.4).
# Copied from Alexis Belmonte's unreal-engine.sh in the `unreal-engine` AUR package,
# adapted per minor.

if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: Run this as an unprivileged user; not as root."
    return
fi

if [ -d "${HOME}/.steam/bin" ] && [ ! -L "${HOME}/.steampath" ]; then
    ln -s "${HOME}/.steam/bin" "${HOME}/.steampath"
elif [ ! -d "${HOME}/.steam/bin" ] && [ ! -L "${HOME}/.steampath" ]; then
    mkdir -p "${HOME}/.steam/bin"
    ln -s "${HOME}/.steam/bin" "${HOME}/.steampath"
fi

# Per-minor user-config dir
if [ ! -d "${HOME}/.config/Epic/UnrealEngine/5.4/Intermediate/" ]; then
    mkdir -p "${HOME}/.config/Epic/UnrealEngine/5.4/Intermediate/"
fi

# Preserve upstream typo path (.cnfig) for compatibility with anything that already wrote there
if [ ! -d "${HOME}/.cnfig/Epic/UnrealEngine/5.4/Intermediate/" ]; then
    mkdir -p "${HOME}/.cnfig/Epic/UnrealEngine/5.4/Intermediate/"
fi

if [ ! -f "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop" ]; then
    cp "/usr/share/applications/com.unrealengine.UE5_4Editor.desktop" \
       "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop"
fi

UE5desktopFileChecksum="$(sha256sum "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop" | cut -f 1 -d ' ')"

if [ "${UE5desktopFileChecksum}" == "ChecksumPlaceholder" ]; then
    UE5editorLocation="$(find InstalledLocationPlaceholder -type f -iname 'UnrealEditor')"
    UE5editorPath="$(echo ${UE5editorLocation/UnrealEditor/})"

    sed -i "7c\\Exec=${UE5editorLocation} %F" "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop"
    sed -i "14c\\Path=${UE5editorPath}" "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop"
fi

# Register this engine with UnrealVersionSelector once, from the INSTALLED
# binary so it records the real /opt/unreal-engine-src-5.4 path (the build-time register
# in Setup.sh was stripped because it recorded the transient build tree). This
# is what wires up .uproject file associations: double-click to open in this
# engine, right-click -> Generate Project Files. Stamped per version so it only
# runs on first launch after install/upgrade.
UE5uvsBin="/opt/unreal-engine-src-5.4/Engine/Binaries/Linux/UnrealVersionSelector-Linux-Shipping"
UE5uvsStamp="${HOME}/.config/Epic/UnrealEngine/5.4/.uvs-registered-5.4.4"
if [ -x "${UE5uvsBin}" ] && [ ! -f "${UE5uvsStamp}" ]; then
    if "${UE5uvsBin}" -register -unattended > /dev/null 2>&1; then
        touch "${UE5uvsStamp}"
    fi
fi

gio launch "${HOME}/.local/share/applications/com.unrealengine.UE5_4Editor.desktop"
