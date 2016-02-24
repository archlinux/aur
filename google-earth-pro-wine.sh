#!/bin/bash -e

# Help message
usage() {
    echo "Usage: $(basename $0) [-q|-v|-h] <filename>"
    echo "Script to launch Google Earth Pro through Wine."
    echo
    echo "Available options:"
    echo "  -q, --quiet         Produce no output."
    echo "  -v, --verbose       Include the Wine debug output."
    echo "  -h, --help          Print this help"
}

# Flags
while [[ $1 ]]; do
    # Can't change $1
    opt=$1

    # Parse current one
    while [[ $opt != - ]]; do
        # Define actions
        case $opt in
            -q* | --quiet)        quiet=1 ;;
            -v* | --verbose)      verbose=1 ;;
            -h* | --help)         usage; exit 0 ;;
            -*)                   echo "$(basename $0): error: bad argument: $opt"
                                  echo
                                  usage $1; exit 0 ;;
            *) break ;;
        esac

        # Support single dash (vmware-patch -fv)
        # ${opt#-:[*]}: Remove first match
        nextopt=${opt#-[qvh]}
        if [[ $opt != $nextopt ]]; then
            # Multiple short flags
            opt=-$nextopt
        else
            # Long form (--quiet/--verbose)
            break
        fi
    done

    # Shift them parameters
    shift
done

# Set Wine home
if [[ ! $WINEPREFIX ]]; then
    WINEPREFIX=~/.wine
fi

# Symlink settings to ~/.googleearthpro
if [[ ! -L ~/.googleearthpro ]]; then
    ln -s $WINEPREFIX/drive_c/users/$USER/AppData/LocalLow/Google/GoogleEarth/ \
          ~/.googleearthpro
fi

# Add path in Wine form (e.g. "z:/home/user/Desktop/lol.kml")
file=$(winepath -w "$@")

# Launch app
if [[ $quiet ]]; then
    wine /opt/google/earth/pro-wine/googleearth.exe "$file" &>/dev/null
elif [[ $verbose ]]; then
    wine /opt/google/earth/pro-wine/googleearth.exe "$file"
else
    WINEDEBUG=-all wine /opt/google/earth/pro-wine/googleearth.exe "$file"
fi
