#! /usr/bin/bash 

## I keep getting this question/comment, so I'll explain the reason for this here for those who feel compelled to ask again:
# This file mainly exists to stop stubborn people who have a bad habit of running everything as root and to make sure specific paths exists to avoid arbitrary legacy compatibility issues.
# It also assists with determining user-chosen custom install locations and ensuring the path to the editor binary path isn't entirely lost in the event 'UnrealEdior' is ever relocated to somewhere else for any arbitrary reason upstream decides.
# If someone really wants to run Unreal with unmitigated admin privileges, any resulting damage is on YOU and not me.
# You can still find the binary or modify this script/PKGBUILD yourself.
# I am *not* going to troubleshoot short-sighted and insecure 'root everything' nonsense.
# Additionally, I will remind you that "/opt" *is used by default* but the option is, again, ultimately up to the you where the installation resides.

if [ "$(id -u)" -eq 0 ]; then
    echo "ERROR: Run this as an unprivileged user; not as root."
    return;
fi

if [ -d "${HOME}/.steam/bin" ] && [ ! -L "${HOME}/.steampath" ]; then
    ln -s "${HOME}/.steam/bin" "${HOME}/.steampath"
elif [ ! -d "${HOME}/.steam/bin" ] && [ ! -L "${HOME}/.steampath" ]; then
    mkdir -p "${HOME}/.steam/bin"
    ln -s "${HOME}/.steam/bin" "${HOME}/.steampath"
fi

if [ ! -d "${HOME}/.config/Epic/UnrealEngine/4.27/Intermediate/" ]; then
    mkdir -p "${HOME}/.config/Epic/UnrealEngine/4.27/Intermediate/"
    ln -s "${HOME}/.config/Epic/UnrealEngine/4.0/Intermediate/" "${HOME}/.config/Epic/UnrealEngine/4.27/Intermediate/"
fi

if [ ! -d "${HOME}/.cnfig/Epic/UnrealEngine/4.27/Intermediate/" ]; then
    mkdir -p "${HOME}/.cnfig/Epic/UnrealEngine/4.27/Intermediate/"
    ln -s "${HOME}/.cnfig/Epic/UnrealEngine/4.0/Intermediate/" "${HOME}/.config/Epic/UnrealEngine/4.27/Intermediate/"
fi

if [ ! -f "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop" ]; then
    cp /usr/share/applications/com.unrealengine.UE4Editor.desktop "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
fi

UE4desktopFileChecksum="$(sha256sum "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop" | cut -f 1 -d ' ')"

if [ "${UE4desktopFileChecksum}" == "ChecksumPlaceholder" ]; then
    UE4editorLocation="$(find InstalledLocationPlaceholder -type f -iname 'UE4Editor')"
    UE4editorPath="$(echo ${UE4editorLocation/UE4Editor/})"
    
    sed -i "7c\Exec=${UE4editorLocation} %F" "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
    sed -i "14c\Path=${UE4editorPath}" "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
fi

gio launch "${HOME}/local/share/applications/com.unrealengine.UE4Editor.desktop"
