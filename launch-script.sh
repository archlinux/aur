#!/bin/bash
# Usage:
# $ trackmania-forever EXECUTABLE_NAME [ARGS ...] [--file-or-url FILE_OR_URL]
# * EXECUTABLE_NAME must be in the installation dir.
# * ARGS are passed to the game.
# * FILE_OR_URL will be turned into a windows path if it is a file, then passed to the game
#   with the appropriate `/url=` or `/file=` prefix.
#
# ENV VARS
# * TMF_USER_DIR
#   where to put user-generated content
#   this defaults to your Documents directory if unset
# * TMF_WINE
#   wine or wine-like command to run the game through
#   this defaults to simply `wine`
: "${TMF_WINE:=wine}"

datadir="${XDG_DATA_HOME:-${HOME}/.local/share}/trackmania-forever"
mkdir -p "${datadir}"

: "${WINEPREFIX:=${datadir}/pfx}"
export WINEPREFIX

# fixes some big rendering issues
# Steam also provides this override and it seems to be working well
WINEDLLOVERRIDES+=";d3dx9_30=native"
export WINEDLLOVERRIDES

args="${#}"
while [ ${args} -gt 0 ]; do
    case "${1}" in
        --file-or-url)
            shift
            args=$(( args - 1 ))
            # if no file/url is given
            [ ${args} -gt 0 ] || break
            case "${1}" in
                tmtp://*)
                    arg="/url=${1}"
                    shift
                    set -- "${@}" "${arg}"
                    ;;
                file://*)
                    set -- "${1:7}" "${@:2}"
                    ;&
                *)
                    arg="/file=$(winepath --windows "${1}")"
                    shift
                    set -- "${@}" "${arg}"
            esac
            ;;
        *)
            arg="${1}"
            shift
            set -- "${@}" "${arg}"
            ;;
    esac
    args=$(( args - 1 ))
done

: "${TMF_USER_DIR:=$(xdg-user-dir DOCUMENTS)/TmForever}"
userdir="$(winepath --windows "${TMF_USER_DIR}")"

${TMF_WINE} "/opt/TmForever/${1}" "${@:2}" "/useexedir" "/userdir=${userdir}"
