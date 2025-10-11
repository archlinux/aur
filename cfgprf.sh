#!/bin/bash

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      HELP=1
      shift # past argument
      ;;
    -i|--import)
      IMPORT=1
      shift # past argument
      ;;
    -e|--export)
      EXPORT=1
      shift # past argument
      ;;
    -p|--packages)
      PACKAGES=1
      shift # past argument
      ;;
    -c|--configs)
      CONFIGS=1
      shift # past argument
      ;;
    -A|--aur)
      AUR=1
      shift # past argument
      ;;
    -a|--all)
      CONFIGS=1
      PACKAGES=1
      shift # past argument
      ;;
    -y|--yes)
      CONFIRM=1
      shift # past argument
      ;;
    -P|--profile)
      PROFILE="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "error: unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

help() {
    echo
    echo
    echo "  cfgprf"
    echo
    echo "  a tool to easily save packages and configs over multiple machines"
    echo "  really useful for reinstalling, which is exactly why i made it"
    echo
    echo "  primary commands:"
    echo "      -e | --export: export mode"
    echo "          -P | --profile: REQUIRED. path to file to write to, preferrably .cfgprf"
    echo "          -p | --packages: export packages with pacman"
    echo "          -A | --aur: export AUR packages with yay or paru"
    echo "          -c | --configs: export files in ~/.config/"
    echo "          -a | --all: shorthard for --packages and --configs together. not having either will default to this"
    echo "      -i | --import: import mode"
    echo "          -P | --profile: REQUIRED. path to file to import from, usually .cfgprf"
    echo "          -p | --packages: import packages with pacman"
    echo "          -A | --aur: import AUR packages with yay or paru"
    echo "          -c | --configs: import files to ~/.config/"
    echo "          -a | --all: shorthard for --packages, --aur and --configs together. not having either will default to this"
    echo "          -y | --yes: will skip confirmation"
    echo
    echo "  other commands:"
    echo "      -h | --help: show this menu"
    echo
    echo "  example usage:"
    echo "      cfgprf --export --packages --configs --profile ~/myconfig.cfgprf"
    echo
}

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

if [ $HELP ]; then
    help
    exit
fi

# setting mode
MODE=NONE

if [ $IMPORT ] && [ $EXPORT ]; then
    MODE=ERROR
elif [ $IMPORT ]; then
    MODE=IMPORT
elif [ $EXPORT ]; then
    MODE=EXPORT
fi

if [ $MODE == "NONE" ]; then
    help
    exit 1
elif [ $MODE == "ERROR" ]; then
    echo "error: both import and export modes selected, that cannot be done. use -h for commands."
    exit 1
fi

# default to --all if neither --packages or --configs
if ! [ $PACKAGES ] && ! [ $CONFIGS ] && ! [ $AUR ]; then
    PACKAGES=1
    AUR=1
    CONFIGS=1
fi

if [ $MODE == "IMPORT" ]; then
# import

    # file stuff
    # checks if file is a valid tar and has the cfgprf file
    if ! [ -f $PROFILE ] || ! tar -tf $PROFILE &> /dev/null || ! tar -tf $PROFILE | grep -q "cfgprf"; then
        echo "error: invalid file"
        exit 1
    fi

    if ! [ $CONFIRM ]; then

        if [ $PACKAGES ] && [ $CONFIGS ]; then
            MESSAGE="are you sure you want to import configs and packages? the configs will override yours, and packages will be installed."
        elif [ $PACKAGES ]; then
            MESSAGE="are you sure you want to import packages? the packages will be installed using pacman."
        elif [ $CONFIGS ]; then
            MESSAGE="are you sure you want to import configs? the configs will override yours, so it is advised to back them up if you don't want to get rid of them."
        fi

        echo
        read -p "${MESSAGE} (Y/n): " CONFIRM

        if [ "${CONFIRM,,}" != "y" ]; then
            echo "aborting"
            echo
            exit
        fi

    fi

    echo
    echo "importing"

    if [ $PACKAGES ]; then

        echo "importing packages"

        PACKAGELIST= tar -xf $PROFILE packages -O

        sudo pacman -S $PACKAGELIST

    fi

    if [ $AUR ]; then

        echo "importing AUR packages"

        PACKAGELIST= tar -xf $PROFILE aur -O

        if command -v yay >/dev/null; then
            yay -S $PACKAGELIST
        elif command -v paru >/dev/null; then
            paru -S $PACKAGELIST
        else
            echo "error: yay nor paru found"
        fi

    fi

    if [ $CONFIGS ]; then

        echo "importing configs"

        TEMP=$(mktemp -d)
        cd $TEMP

        tar -xf $PROFILE &>/dev/null

        rsync -a "config/" "$HOME/.config/" >/dev/null

        rm -r $TEMP

    fi

    echo
    echo "finished importing"
    echo

elif [ $MODE == "EXPORT" ]; then
# export

    echo
    echo "exporting"

    # empty file cause don't wanna append nuh uh
    > $PROFILE
    TEMP=$(mktemp -d)

    cd $TEMP

    if [ $PACKAGES ]; then

        echo "exporting packages"

        pacman -Qe > "packages"

        tar -rf $PROFILE "packages"

    fi

    if [ $AUR ]; then

        echo "exporting AUR packages"

        if command -v yay >/dev/null; then
            yay -Qem > "aur"
            tar -rf $PROFILE "aur"
        elif command -v paru >/dev/null; then
            paru -Qem > "aur"
            tar -rf $PROFILE "aur"
        else
            echo "error: yay nor paru found"
        fi

    fi

    if [ $CONFIGS ]; then

        echo "exporting configs"

        mkdir "config"

        # so many excludes cause some programs like vscode and discord abuse ~/.config/
        EXCLUDE=(
            "--exclude=*.log"
            "--exclude=*.tmp"
            "--exclude=*cache*"
            "--exclude=*Cache*"
            "--exclude=sessionData"
        )

        rsync "${EXCLUDE[@]}" -a "$HOME/.config/" "config/"

        tar -rf $PROFILE "config"

    fi

    touch "cfgprf"
    tar -rf $PROFILE "cfgprf"

    rm -r $TEMP

    echo
    echo "finished exporting"
    echo

fi