#!/bin/bash

##############################################
## prevent running by root/sudo
# refer Wine official FAQ, do not run wine with sudo or root permission.
function prevent-root() {
    if [[ $(id -u) -eq 0 ]];
    then
        echo "ERROR: you should not use root/sudo to run this application." >&2
        echo "ERROR: prevent running by root/sudo" >&2
        exit 1
    fi
}
##############################################


##############################################
## handle the arguments passed from commandline
# required argument:
#   "$@" - which was passed from commandline.
function handle-param(){
    #parameters=$(getopt -o h --long version,winetricks,winecfg,help -n "$0" -- "$@")    # NOTUSED: because $(getopt) cannot ignore unknown options
    
    local -a temp_parameters
    temp_parameters=()
    # Avoid unexpected error, in case user pass an initial
    # value in command line.
    declare -ga next_parameters
    next_parameters=()

    local temp_para
    local temp_para_type
    local temp_string
    while [[ -n "$1" ]] ; do
        # temp_para_type
        #   ll: long option with a secondary argument
        #   l: long option without any other argument
        #   s: short option
        #   n: normal argument
        temp_para_type=""
        temp_para=""
        if [[ ${1::2} == "--" ]];
        then
            if [[ "$1" == *"="* ]];
            then
                temp_para="${1%%=*}"
                temp_para_type="ll"
            else
                temp_para="$1"
                temp_para_type="l"
            fi
        elif [[ ${1::1} == "-" ]];
        then
            temp_para="$1"
            temp_para_type="s"
        else
            temp_para="$1"
            temp_para_type="n"
        fi

        case "$temp_para" in
            -h| --help)
                print-help
                exit ;;
            --version)
                set-env
                print-version
                exit ;;
            --clear-cache)
                set-env
                clear-cache
                exit ;;
            --winetricks)
                declare -g RUN_WINETRICKS
                RUN_WINETRICKS=1
                declare -g WINETRICKS_BIN
                if [[ "$temp_para_type" == "ll" ]];
                then
                    WINETRICKS_BIN="${1#*=}"
                else
                    WINETRICKS_BIN="$(command -v winetricks)"
                fi
                shift ;;
            --winecfg)
                declare -g RUN_WINECFG
                RUN_WINECFG=1
                declare -g WINECFG_BIN
                if [[ "$temp_para_type" == "ll" ]];
                then
                    WINECFG_BIN="${1#*=}"
                else
                    WINECFG_BIN="$(command -v winecfg)"
                fi
                shift ;;
            --)
                shift
                if [[ -n "$*" ]];
                then
                    # then $next_parameters will be passed to wine
                    next_parameters+=("$@")
                    shift $#
                    break
                fi
                ;;
            *)
                if [[ "$temp_para_type" == "s" && ${#1} -gt 2 ]];
                then
                    temp_string="$(getopt -o 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ -n "$0" -- "$1")"
                    temp_string="${temp_string%%' --'*}"
                    temp_parameters=()
                    for i in $temp_string; do
                        temp_parameters+=("$i")
                    done
                    shift
                    temp_parameters=("${temp_parameters[@]}" "$@")
                    set -- "${temp_parameters[@]}"
                else
                    next_parameters+=("$1")
                    shift
                fi
                ;;
        esac
    done
}
##############################################


##############################################
function print-help() {
    cat << EOF
netease-cloud-music-wine
A wrapper script to run cloudmusic.exe with wine.

Usage: netease-cloud-music-wine [OPTION]... [MUSIC_FILE]

options automatically catched by wrapper script:
--winetricks[=<WINETRICKS_BIN>]
        Skip running cloudmusic.exe, only run winetricks
        with wine container. By default, it would use the
        winetricks in \$PATH. You can specify another
        winetricks executive file.
--winecfg[=<WINECFG_BIN>]
        Skip running cloudmusic.exe, only run winecfg
        with wine container. By default, it would use the
        winecfg binary file in \$PATH. You can specify
        another winecfg binary file.
-h, --help
        Show this help.
--version
        Show version number of package and local cache.


options automatically passed to cloudmusic.exe
--force-device-scale-factor=<SCALE_RATE>
        Scale the cloudmusic.exe GUI with <SCALE_RATE>.
        Default is 1. You can specify other scale rate,
        e.g. 0.8, 1.2, 3.5...etc.


If you want to explicitly pass through some arguments to
cloudmusic.exe, you can place "--" before the arguments.
For example:
    netease-cloud-music-wine -a -- -b -c
option "-a" will be passed to run script, while "-b" and
"-c" will be passed directly to cloudmusic.exe. 

EOF
}
##############################################


##############################################
## set some default environment variables
function set-env() {
    if [[ -n "${XDG_CACHE_HOME}" ]];
    then
        SETUP_DIR="${XDG_CACHE_HOME}"/netease-cloud-music-wine
    else
        SETUP_DIR="${HOME}"/.cache/netease-cloud-music-wine
    fi
    
    export WINEPREFIX="${SETUP_DIR}"/prefix
    
    # prevent wine setting up application menu
    # disable gecko override
    # disable mono override
    export WINEDLLOVERRIDES="winemenubuilder.exe=d;mshtml,mscoree="
    
    # prevent wine showing noisy debug message.
    if [[ -z "${WINEDEBUG}" ]];
    then
        export WINEDEBUG=-all
    fi
}
##############################################


##############################################
## Print version
# required env:
#   $SETUP_DIR - set by set-env()
#   $WINEPREFIX - set by set-env()
function print-version() {
    version_package="$(cat /opt/netease-cloud-music-wine/netease-cloud-music.version 2>/dev/null)"
    version_local="$(cat "${WINEPREFIX}"/netease-cloud-music.version 2>/dev/null)"
    if [[ -z "$version_package" ]];
    then
        echo "version_package= NOT FOUND(Maybe the package was damaged?)"
    else
        echo "version_package=$version_package"
    fi

    if [[ -z "$version_local" ]];
    then
        echo "version_local= NOT FOUND(Maybe the local cache/container was damaged?)"
    else
        echo "version_local=$version_local"
        echo "  cache directory=$SETUP_DIR"
        echo "  container directory=$WINEPREFIX"
    fi
}
##############################################


##############################################
## clear wine container and cache
# Delete cache directory(including wine container),
# in case the wine container has been damaged.
# required env:
#   $SETUP_DIR - set by set-env()
function clear-cache() {
    if [[ -z "${SETUP_DIR}" ]];
    then
        echo 'environment variable SETUP_DIR not set.' >&2
        exit 1
    elif [[ ! -d "${SETUP_DIR}" ]];
    then
        echo "cannot find cache directory: ${SETUP_DIR}"
        exit 1
    fi

    echo "cache directory: ${SETUP_DIR}"
    echo "All data in cache directory will be delete, including downloaded music and wine container."
    read -p "Delete cache directory?(y/N): " READ_INPUT
    [[ -z "$READ_INPUT" ]] && exit

    case "$READ_INPUT" in
        Y| y| yes| YES| Yes)
            rm -rfv "${SETUP_DIR}"
            return
            ;;
        N| n| no| NO| No)
            return
            ;;
        *)
            echo "Invalid input." >&2
            exit 1
            ;;
    esac
}
##############################################


##############################################
## reset cache directory and wine container
# required env:
#   $SETUP_DIR - set by set-env()
#   $WINEPREFIX - set by set-env()
function reset-container() {
    if [[ -z "${WINEPREFIX}" ]];
    then
        echo "\$WINEPREFIX not set." >&2
        exit
    fi

    # move the default download directory out of WINEPREFIX.
    mkdir -p "${SETUP_DIR}/default_download_music"
    if [[ -d "${WINEPREFIX}/drive_c/CloudMusic" ]];
    then
        if [[ ! -L "${WINEPREFIX}/drive_c/CloudMusic" ]];
        then
            cp -rfla "${WINEPREFIX}/drive_c/CloudMusic"/* "${SETUP_DIR}/default_download_music"
            rm -rf "${WINEPREFIX}/drive_c/CloudMusic"
            ln -sf ../../default_download_music "${WINEPREFIX}/drive_c/CloudMusic"
        fi
    fi

    rm -rf "${WINEPREFIX}"
    mkdir -p "${WINEPREFIX}"
    
    # only setup wineprefix and do nothing
    wine cmd /C
    
    # not necessary to update WINEPREFIX automatically every time
    echo "disable" > "$WINEPREFIX/.update-timestamp"
    
    mkdir -p "${WINEPREFIX}/drive_c/NetEase"
    ln -sfn /opt/netease-cloud-music-wine/NetEase/CloudMusic "${WINEPREFIX}/drive_c/NetEase/CloudMusic"
    wine regedit "/opt/netease-cloud-music-wine/netease-cloud-music.reg"
    cp -f /opt/netease-cloud-music-wine/netease-cloud-music.version "${WINEPREFIX}"/netease-cloud-music.version
    ln -s ../../default_download_music "${WINEPREFIX}/drive_c/CloudMusic"

}
##############################################

prevent-root

handle-param "$@"

set-env

if [[ ! -f "${WINEPREFIX}/drive_c/NetEase/CloudMusic/cloudmusic.exe" ]];
then
    echo "First run, setup wineprefix."
    reset-container
fi

version_package="$(cat /opt/netease-cloud-music-wine/netease-cloud-music.version 2>/dev/null)"
version_local="$(cat "${WINEPREFIX}"/netease-cloud-music.version 2>/dev/null)"
if [[ "${version_local}" != "${version_package}" ]];
then
    echo "Version updated, update wineprefix."

    if [[ -d "${WINEPREFIX}/drive_c/users/${USER}/AppData/Local/NetEase" ]];
    then
        # save user settings before clear container.
        mkdir "${SETUP_DIR}/.temp_save_setting"
        mv "${WINEPREFIX}/drive_c/users/${USER}/AppData/Local/NetEase" "${SETUP_DIR}/.temp_save_setting"

        reset-container

        # restore user settings.
        mkdir "${WINEPREFIX}/drive_c/users/${USER}/AppData/Local"
        mv -f "${SETUP_DIR}/.temp_save_setting/NetEase" "${WINEPREFIX}/drive_c/users/${USER}/AppData/Local/NetEase"
        rmdir "${SETUP_DIR}/.temp_save_setting"
    else
        reset-container
    fi
fi

if [[ $RUN_WINETRICKS -eq 1 ]];
then
    $WINETRICKS_BIN
elif [[ $RUN_WINECFG -eq 1 ]];
then
    $WINECFG_BIN;
else
    wine "C:\\Netease\\CloudMusic\\cloudmusic.exe" "${next_parameters[@]}"
fi

wineserver -k

