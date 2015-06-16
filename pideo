#!/bin/bash

menu () {
    local CANCEL_OPT

    local OPT
    local OPTIND
    local OPTARG
    while getopts ':c:' OPT; do
        case "$OPT" in
            c) CANCEL_OPT="$OPTARG"
        esac
    done

    shift $(( $OPTIND - 1 ))

    N=1
    while [[ "$#" -gt 0 ]]; do
        printf ' \033[1;36m%2s\033[m  %s\n' "$N" "$1" >&2
        shift

        N=$(( $N + 1 ))
    done

    if [[ -n "$CANCEL_OPT" ]]; then
        printf '\n \033[1;35m 0\033[m  %s\n' "$CANCEL_OPT" >&2
    fi

    printf '\n  \033[m> \033[m' >&2
    read NUM

    printf '%s' "$NUM"
}

pick_device () {
    local -i Choice
    local DevString
    local -a DevStringArr
    local -a DevNames
    while read ROW; do
        local Name="$(cut -d' ' -f 1 <<<"$ROW")"
        local Type="$(cut -d' ' -f 2 <<<"$ROW")"
        local FsType="$(cut -d' ' -f 3 <<<"$ROW")"
        local Label="$(cut -d' ' -f 4 <<<"$ROW")"
        local Uuid="$(cut -d' ' -f 5 <<<"$ROW")"

        if [ "$Type" == 'part' ] && [ "$FsType" != 'swap' ]; then
            DevString="$(printf "\033[1m$Label\033[m  /dev/$Name  $Uuid\033[m")"

            DevStringArr+=("$DevString")
            DevNames+=("$Name")
        fi
    done < <(lsblk -ro NAME,TYPE,FSTYPE,LABEL,UUID | tail -n +2)

    # Select the device
    if [ "${#DevStringArr}" -eq 0 ]; then
        printf "\033[1;31m¡No hay dispositivos en los que buscar!\033[m\n" >&2
        exit 1
    elif [ "${#DevStringArr}" -eq 1 ]; then
        Choice=1
    else
        Choice="$(menu "${DevStringArr[@]}")"
    fi

    Choice=$(( $Choice - 1 ))
    printf '%s' "${DevNames[$Choice]}"
}

mount_device () {
    devmon -g --unmount "/dev/$1" &>/dev/null
    devmon -g --mount "/dev/$1" | tail -n 1 | grep -oE '[^ ]+$'
}

pick_video () {
    printf '\n \033[1m[ \033[32m%s \033[;1m]\033[m\n\n' "$1" >&2

    # Populate the arrays for the menu
    local -a Files
    local -a FileNames

    for f in "$1"/*; do
        if [ -d "$f" ]; then
            Files+=("$f")
            FileNames+=("$(printf '\033[33;1m%s\033[m' "$(basename "$f")")")
        elif [ -f "$f" ]; then
            Files+=("$f")
            FileNames+=("$(printf '\033[1m%s\033[m' "$(basename "$f")")")
        fi
    done

    # Pop a menu to select
    local Choice=$(menu "${FileNames[@]}")
    Choice=$(( $Choice - 1 ))
    local Entry="${Files[$Choice]}"

    # If it's a directory, recurse. Else, we're done
    if [ -d "$Entry" ]; then
        pick_video "$Entry" "$2"
    else
        printf '%s' "$Entry"
    fi
}

pick_subtitle () {
    local Choice="$(menu -c 'Ninguno' 'Inglés' 'Español')"
    case $Choice in
        1) echo en ;;
        2) echo es ;;
    esac
}

download_subtitle () {
    subliminal -l "$1" -- "$2" &>/dev/null
    printf "${2%.*}.$1.srt"
}

DevName="$(pick_device)"
printf 'Montando dispositivo \033[1m%s\033[m...\n' "/dev/$DevName"
MntPoint="$(mount_device "$DevName")"
printf 'Dispositivo \033[1m%s\033[m montado en \033[1m%s\033[m\n' "/dev/$DevName" "$MntPoint"

VideoFile="$(pick_video "$MntPoint")"
SubLang="$(pick_subtitle)"

if [ -z "$SubLang" ]; then
    printf 'Reproduciendo \033[1m%s\033[m...\n' "$VideoFile"
    omxplayer -b "$VideoFile"
else
    printf 'Obteniendo subtítulo con idioma \033[1m%s\033[m...\n' "$SubLang"
    SubFile="$(download_subtitle "$SubLang" "$VideoFile")"

    printf 'Playing video \033[1m%s\033[m...\n' "$VideoFile"
    omxplayer -b --subtitles "$SubFile" "$VideoFile"
fi

printf 'Desmontando dispositivo \033[1m%s\033[m...\n' "/dev/$DevName"
devmon -g --unmount "/dev/$DevName" &>/dev/null
