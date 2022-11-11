#! /usr/bin/bash 

if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: Run this as an unprivileged user; not as root."
fi

if [ ! -d "${HOME}/.steampath" ] && [ -d "${HOME}/.steam/bin" ]; then
    ln -s "${HOME}/.steampath" "${HOME}/.steam/bin"
elif [ ! -d "${HOME}/.steampath" ] && [ ! -d "${HOME}/.steam/bin" ]; then
    mkdir -p "${HOME}/.steam/bin"
    ln -s "${HOME}/.steampath" "${HOME}/.steam/bin"
fi

if [ ! -d "${HOME}/.config/Epic/UnrealEngine/4.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.config/Epic/UnrealEngine/4.0/Intermediate/"
fi

if [ ! -d "${HOME}/.cnfig/Epic/UnrealEngine/4.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.cnfig/Epic/UnrealEngine/4.0/Intermediate/"
fi

if [ ! -f "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop" ]; then
    cp /usr/share/applications/com.unrealengine.UE4Editor.desktop "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
fi

UE4desktopFileChecksum="$(sha256sum "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop" | cut -f 1 -d ' ')"

if [ "${UE4desktopFileChecksum}" == "ChecksumPlaceholder" ]; then
    UE4editorLocation=$(find InstalledLocationPlaceholder -type f -iname 'UnrealEditor')
    UE4editorPath=$(${UE4editorLocation} | sed 's/UnrealEditor//')
    
    sed -i "7c\Exec=${UE4editorLocation} %F" "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
    sed -i "14c\Path=${UE4editorPath}" "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
fi

xdg-open "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
