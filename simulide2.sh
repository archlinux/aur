#!/bin/sh
# Launcher for the SimulIDE 2 binary release.
#
# SimulIDE resolves "./data" (component sets, the bundled QEMU, the ESP32 ROM
# images) against the *current working directory* rather than against its own
# location, so it has to be started from its installation prefix.  Existing
# relative file arguments are made absolute beforehand so that invocations such
# as "simulide2 blink.sim2" still refer to the file the user meant.

_prefix=/opt/simulide2

for _arg do
    shift
    case $_arg in
        -* | /*)
            set -- "$@" "$_arg"
            ;;
        *)
            if [ -e "$_arg" ]; then
                set -- "$@" "$(realpath -- "$_arg")"
            else
                set -- "$@" "$_arg"
            fi
            ;;
    esac
done

cd "$_prefix" || exit 1
exec ./bin/simulide "$@"
