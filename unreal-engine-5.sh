#! /usr/bin/bash 

## I keep getting this question/comment, so I'll explain the reason for this here for those who feel compelled to ask again:
# This file mainly exists to stop stubborn people who have a bad habit of running everything as root and to make sure specific paths exists to avoid arbitrary legacy compatibility issues.
# It also assists with determining user-chosen custom install locations and ensuring the path to the editor binary path isn't entirely lost in the event 'UnrealEdior' is ever relocated to somewhere else for any arbitrary reason upstream decides.

if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: Run this as an unprivileged user; not as root."
    return;
fi

if [ -d "${HOME}/.steam" ] && [ ! -L "${HOME}/.steam/bin" ]; then
    ln -s "${HOME}/.steampath" "${HOME}/.steam/bin"
elif [ ! -d "${HOME}/.steampath" ] && [ ! -L "${HOME}/.steam/bin" ]; then
    mkdir -p "${HOME}/.steam/bin"
    ln -s "${HOME}/.steam" "${HOME}/.steam/bin"
fi

if [ ! -d "${HOME}/.config/Epic/UnrealEngine/5.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.config/Epic/UnrealEngine/5.0/Intermediate/"
fi

if [ ! -d "${HOME}/.cnfig/Epic/UnrealEngine/5.0/Intermediate/" ]; then
    mkdir -p "${HOME}/.cnfig/Epic/UnrealEngine/5.0/Intermediate/"
fi

if [ ! -f "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop" ]; then
    cp /usr/share/applications/com.unrealengine.UE5Editor.desktop "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop"
fi

UE5desktopFileChecksum="$(sha256sum "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop" | cut -f 1 -d ' ')"

if [ "${UE5desktopFileChecksum}" == "ChecksumPlaceholder" ]; then
    UE5editorLocation="$(find InstalledLocationPlaceholder -type f -iname 'UnrealEditor')"
    UE5editorPath="$(echo ${UE5editorLocation/UnrealEditor/})"
    
    sed -i "7c\Exec=${UE5editorLocation} %F" "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop"
    sed -i "14c\Path=${UE5editorPath}" "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop"
fi

gio launch "${HOME}/.local/share/applications/com.unrealengine.UE5Editor.desktop"
