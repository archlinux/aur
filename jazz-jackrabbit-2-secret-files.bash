#!/usr/bin/env bash
set -eu

PKGNAME='gog-jazz-jackrabbit-2-secret-files'
APPNAME='Jazz Jackrabbit 2'
EXE="C:/GOG Games/${APPNAME}/Jazz2.exe"

##
## Argument parsing (argbash.io)
##

# Default arguments
_arg_fullscreen=off
_arg_resolution="1280x960"

die()
{
  local _ret=$2
  test -n "$_ret" || _ret=1
  test "$_PRINT_HELP" = yes && print_help >&2
  echo "$1" >&2
  exit ${_ret}
}

print_help ()
{
  printf "%s\n" "The general script's help msg"
  printf 'Usage: %s [--(no-)fullscreen] [-r|--resolution <arg>] [-h|--help]\n' "$0"
  printf "\t%s\n" "--fullscreen,--no-fullscreen: Launch as fullscreen (off by default)"
  printf "\t%s\n" "-r,--resolution: set the resolution (default: '"1280x960"')"
  printf "\t%s\n" "-h,--help: Prints help"
}

parse_commandline ()
{
  while test $# -gt 0
  do
    _key="$1"
    case "$_key" in
      --no-fullscreen|--fullscreen)
        _arg_fullscreen="on"
        test "${1:0:5}" = "--no-" && _arg_fullscreen="off"
        ;;
      -r|--resolution)
        test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
        _arg_resolution="$2"
        shift
        ;;
      --resolution=*)
        _arg_resolution="${_key##--resolution=}"
        ;;
      -r*)
        _arg_resolution="${_key##-r}"
        ;;
      -h|--help)
        print_help
        exit 0
        ;;
      -h*)
        print_help
        exit 0
        ;;
      *)
        _PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
        ;;
    esac
    shift
  done
}

parse_commandline "$@"

##
## Setup wine and launch game
##
export WINEARCH='win32'
export WINEPREFIX=$HOME/.local/share/$PKGNAME/wine
export WINEDLLOVERRIDES="mscoree,mshtml=" # Skip mono, gecko
APPDIR_INSTALL=/opt/$PKGNAME
APPDIR_PARENT="${WINEPREFIX}/drive_c/GOG Games"
APPDIR_USER=$HOME/.local/share/$PKGNAME/user

# Symlink install dir to user dir (to give write access)
if ! [ -d $APPDIR_USER ]; then
  mkdir -p $APPDIR_USER
  cp -as -T $APPDIR_INSTALL $APPDIR_USER
fi


echo >&2 "Setting up wine prefix"
if ! [ -d "${WINEPREFIX}" ]; then
  (
    mkdir -pv "${WINEPREFIX}"
    wineboot -i
    rm -fv "${WINEPREFIX}/dosdevices/z:"
  )
fi

echo >&2 "Setting up wine game directory"
if ! [ -d "${APPDIR_PARENT}/${APPNAME}" ]; then
  (
    mkdir -pv "${APPDIR_PARENT}"
    ln -fnsv "${APPDIR_USER}" "${APPDIR_PARENT}/${APPNAME}"
  )
fi

if [ $_arg_fullscreen = "on" ]; then
    echo >&2 "Launching ${APPNAME} via wine (fullscreen)"
    wine "${EXE}"
else
    echo >&2 "Launching ${APPNAME} via wine (windowed)"
    wine explorer /desktop="JJ2",$_arg_resolution "${EXE}" /Windowed
fi

echo >&2 "Finished"
