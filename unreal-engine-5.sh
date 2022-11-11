#! /usr/bin/bash 

if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: Run this as an unprivileged user; not as root."
    return;
fi

if [ ! -d "${HOME}/.steampath" ] && [ -d "${HOME}/.steam/bin" ]; then
    ln -s "${HOME}/.steampath" "${HOME}/.steam/bin"
elif [ ! -d "${HOME}/.steampath" ] && [ ! -d "${HOME}/.steam/bin" ]; then
    mkdir -p "${HOME}/.steam/bin"
    ln -s "${HOME}/.steampath" "${HOME}/.steam/bin"
fi

if [ ! -d "${HOME}/.config/Epic/UnrealEngine/5.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.config/Epic/UnrealEngine/5.0/Intermediate/"
fi

if [ ! -d "${HOME}/.cnfig/Epic/UnrealEngine/5.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.cnfig/Epic/UnrealEngine/5.0/Intermediate/"
fi

if [ ! -f "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop" ]; then
    cp /usr/share/applications/com.unrealengine.UE5Editor.desktop "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop"
fi

UE5desktopFileChecksum="$(sha256sum "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop" | cut -f 1 -d ' ')"

if [ "${UE5desktopFileChecksum}" == "ChecksumPlaceholder" ]; then
    UE5editorLocation=$(find InstalledLocationPlaceholder -type f -iname 'UnrealEditor')
    UE5editorPath=$(${UE5editorLocation} | sed 's/UnrealEditor//')
    
    sed -i "7c\Exec=${UE5editorLocation} %F" "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop"
    sed -i "14c\Path=${UE5editorPath}" "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop"
fi

xdg-open "${HOME}/local/share/applications/com.unrealengine.UE5Editor.desktop"
