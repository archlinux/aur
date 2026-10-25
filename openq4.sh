#!/bin/sh
# openQ4 launcher, installed as openq4 with openq4-dedicated and
# openq4-steamdeck symlinked to it.
#
# openQ4 mounts <cwd>/baseoq4 and <cwd>/q4base as its locked content overlay
# (fs_cdpath), which is where the openQ4 runtime and the Quake 4 1.4.2 patch
# paks live, so it has to run from the install directory.
#
# The retail paks (pak001-pak012, zpak_*) are looked up in OPENQ4_QUAKE4_PATH
# first (default /opt/quake4, where the quake4-data-* packages install them),
# then in Steam and GOG installs. "+set fs_basepath <dir>" still overrides both.

OPENQ4_DIR=/opt/openq4
export OPENQ4_QUAKE4_PATH="${OPENQ4_QUAKE4_PATH:-/opt/quake4}"

case "$(basename "$0")" in
    openq4-dedicated)
        bin=openQ4-ded_@ARCH@
        ;;
    openq4-steamdeck)
        export OPENQ4_STEAMDECK="${OPENQ4_STEAMDECK:-1}"
        set -- +set com_platformProfile steamdeck "$@"
        bin=openQ4-client_@ARCH@
        ;;
    *)
        bin=openQ4-client_@ARCH@
        ;;
esac

cd "$OPENQ4_DIR" || exit 1
exec "./$bin" "$@"
