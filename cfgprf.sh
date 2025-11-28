#!/bin/sh

OPTS=$(getopt -o hiepcAEdaysrP: --long help,import,export,packages,configs,configs-opts,etc,dotdirs,dotdirs-opts:,aur,all,yes,symlinks,root,profile: -n 'cfgprf' -- "$@")

if [ $? -ne 0 ]; then
  echo "failed to parse options" >&2
  exit 1
fi

eval set -- "$OPTS"

while true; do
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
    -E|--etc)
      ETC=1
      shift # past argument
      ;;
    -d|--dotdirs)
      DOTDIRS=1
      shift # past argument
      ;;
    -A|--aur)
      AUR=1
      shift # past argument
      ;;
    -a|--all)
      CONFIGS=1
      PACKAGES=1
      AUR=1
      ETC=1
      DOTDIRS=1
      shift # past argument
      ;;
    -y|--yes)
      CONFIRM=1
      shift # past argument
      ;;
    # sorry for changing what -s does
    -s|--symlinks)
      SYMLINKS=1
      shift # past argument
      ;;
    -r|--root)
      ROOT=1
      shift # past argument
      ;;
    -P|--profile)
      PROFILE="$2"
      shift # past argument
      shift # past value
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "error idk"
      exit 1
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

help() {
    echo
    echo
    echo "  cfgprf"
    echo
    echo "  a tool to easily save packages and dotfiles over multiple machines"
    echo "  really useful for reinstalling, which is exactly why i made it"
    echo
    echo "  primary commands:"
    echo "      -e | --export: export mode"
    echo "          -P | --profile {path}: REQUIRED. path to file to write to, preferrably .cfgprf"
    echo "          -p | --packages: export packages with pacman"
    echo "          -A | --aur: export AUR packages with yay or paru"
    echo "          -c | --configs: export files in XDG_CONFIG_HOME (${XDG_CONFIG_HOME})"
    echo "          -E | --etc: export files in /etc/, requires to be ran as sudo (but not as root user)"
    echo "          -d | --dotdirs: i don't recommend this. export dot directories in HOME, excludes ssh & gpg keys, .steam/, .wine/ & obviously .config/, use --configs for the last one"
    echo "          -a | --all: shorthard for --packages, --aur, --configs, --etc & --dotdirs together"
    echo "          -s | --symlinks: will export symlinks rather than following them. affects --configs, --etc & --dotdirs"
    echo "          -r | --root: allow running as root, why??"
    echo
    echo "      -i | --import: import mode"
    echo "          -P | --profile {path}: REQUIRED. path to file to import from, usually .cfgprf"
    echo "          -p | --packages: import packages with pacman"
    echo "          -A | --aur: import AUR packages with yay or paru"
    echo "          -c | --configs: import files to XDG_CONFIG_HOME (${XDG_CONFIG_HOME})"
    echo "          -E | --etc: import files to /etc/, requires to be ran as sudo (but not as root user, but you can use --root)"
    echo "          -d | --dotdirs: i don't recommend this. import dot directories in HOME"
    echo "          -a | --all: shorthard for --packages, --aur, --configs, --etc & --dotdirs together"
    echo "          -y | --yes: will skip confirmation"
    echo "          -s | --symlinks: will override symlinks rather than following them. affects --configs, --etc & --dotdirs"
    echo "          -r | --root: allow running as root, why??"
    echo
    echo "  other commands:"
    echo "      -h | --help: show this menu"
    echo
    echo "  example usage:"
    echo "      cfgprf --export --packages --configs --profile ~/myconfig.cfgprf"
    echo "      or"
    echo "      cfgprf -epcP ~/myconfig.cfgprf"
    echo
}

if [ $HELP ]; then
    help
    exit
fi

if [ $HOME == "/root" ] && ! [ $ROOT ]; then
    HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
    if [ $HOME == "/root" ]; then
        echo "cannot run as root, you need to run this as user, but sudo works"
        echo "or use --root"
        exit 1
    fi
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
    exit
elif [ $MODE == "ERROR" ]; then
    echo "error: both import and export modes selected, that cannot be done. see --help for more info."
    exit 1
fi

if ! [ $PROFILE ]; then
    echo "error: profile file not selected at all, please atleast give a path with --profile /path/to/config.cfgprf"
    exit 1
fi

# don't default now
if ! [ $PACKAGES ] && ! [ $CONFIGS ] && ! [ $AUR ] && ! [ $ETC ] && ! [ $DOTDIRS ]; then
    echo "error: no options to import/export were selected, please select atleast one or --all. see --help for more info."
    echo "    it previously did default to --all if nothing were selected, but that is now not the case."
    exit 1
fi

if [ $MODE == "IMPORT" ]; then
# import

    # file stuff
    # checks if file is a valid tar and has the cfgprf file
    if ! [[ -f $PROFILE ]] || ! tar -tf $PROFILE &> /dev/null || ! tar -tf $PROFILE | grep -q "cfgprf"; then
        echo "error: invalid profile file. either not a file or not a cfgprf."
        exit 1
    fi

    if ! [ $CONFIRM ]; then

        echo
        echo "are you sure you want to import the following:"
        if [ $PACKAGES ]; then
            echo "  packages, will be installed using pacman"
        fi
        if [ $AUR ]; then
            echo "  AUR packages, will be installed using yay or paru"
        fi
        if [ $CONFIGS ]; then
            echo "  configs, will override your dotfiles (if they already exist) in XDG_CONFIG_HOME (${XDG_CONFIG_HOME})"
        fi
        if [ $ETC ]; then
            echo "  etc, will override your files (if they already exist) in /etc/"
        fi
        if [ $DOTDIRS ]; then
            echo "  dot directories, will override your files (if they already exist) in dot directories which are located at ~"
        fi

        read -p "(Y/n): " CONFIRM

        if [ "${CONFIRM,,}" != "y" ]; then
            echo "aborting"
            echo
            exit
        fi

    fi

    echo
    echo "importing"

    TEMP=$(mktemp -d)
    cd $TEMP

    if [ $PACKAGES ]; then

        if tar -tf $PROFILE packages >/dev/null 2>&1; then

            echo "importing packages"

            PACKAGELIST=$(tar -xf $PROFILE packages -O)

            sudo pacman -S ${PACKAGELIST}

        else
            echo "warning: skipping importing packages because profile does not have package info"
        fi

    fi

    if [ $AUR ]; then

        if tar -tf $PROFILE aur >/dev/null 2>&1; then

            echo "importing AUR packages"

            PACKAGELIST=$(tar -xf $PROFILE aur -O)

            if command -v yay >/dev/null; then
                yay -S $PACKAGELIST
            elif command -v paru >/dev/null; then
                paru -S $PACKAGELIST
            else
                echo "error: yay nor paru found"
            fi

        else
            echo "skipping importing AUR packages because profile does not have package info"
        fi

    fi

    if [ $CONFIGS ]; then

        if tar -tf $PROFILE config/ >/dev/null 2>&1; then

            echo "importing configs"

            tar -xf $PROFILE >/dev/null 2>&1

            if [ $SYMLINKS ]; then
                rsync -a "config/" "$XDG_CONFIG_HOME" >/dev/null
            else
                rsync -aK "config/" "$XDG_CONFIG_HOME" >/dev/null
            fi

        else
            echo "warning: skipping importing configs because profile does not have config info"
        fi

    fi

    if [ $ETC ]; then

        if [[ $EUID -ne 0 ]]; then
            echo "warning: skipping importing etc because script was not run as root"
        else

            if tar -tf $PROFILE etc/ >/dev/null 2>&1; then

                echo "importing etc"

                tar -xf $PROFILE >/dev/null 2>&1

                if [ $SYMLINKS ]; then
                    rsync -a "etc/" "/etc/"
                else
                    rsync -aK "etc/" "/etc/"
                fi

            else
                echo "warning: skipping importing etc because profile does not have etc info"
            fi

        fi

    fi

    if [ $DOTDIRS ]; then

        if tar -tf $PROFILE dotdirs/ >/dev/null 2>&1; then

            echo "importing dot directories"

            tar -xf $PROFILE >/dev/null 2>&1

            if [ $SYMLINKS ]; then
                rsync -a "dotdirs/" "${HOME}/"
            else
                rsync -aK "dotdirs/" "${HOME}/"
            fi

        else
            echo "warning: skipping importing dot directories because profile does not have dot directory info"
        fi

    fi

    rm -r $TEMP

    echo
    echo "finished importing"
    echo

elif [ $MODE == "EXPORT" ]; then
# export

    echo
    echo "exporting"

    if  [ -f $PROFILE ]; then
        > $PROFILE
    else
        touch $PROFILE;
    fi

    TEMP=$(mktemp -d)

    cd $TEMP

    if [ $PACKAGES ]; then

        echo "exporting packages"

        pacman -Qqe > "packages"

        tar -rf $PROFILE "packages"

    fi

    if [ $AUR ]; then

        echo "exporting AUR packages"

        if command -v yay >/dev/null; then
            yay -Qqm > "aur"
            tar -rf $PROFILE "aur"
        elif command -v paru >/dev/null; then
            paru -Qqm > "aur"
            tar -rf $PROFILE "aur"
        else
            echo "error: yay nor paru found"
        fi

    fi

    if [ $CONFIGS ]; then

        echo "exporting configs"

        mkdir "config"

        # so many excludes cause some programs like vscode and discord (electron in general) abuse XDG_CONFIG_HOME
        EXCLUDE=(
            "--exclude=*.log"
            "--exclude=*.tmp"
            "--exclude=*cache*"
            "--exclude=*Cache*"
            "--exclude=sessionData"
        )

        rsync ${EXCLUDE[@]} -am "${XDG_CONFIG_HOME}" "config/"

        if [ $SYMLINKS ]; then
            tar -rf $PROFILE "config" >/dev/null 2>&1
        else
            tar -rhf $PROFILE "config" >/dev/null 2>&1
        fi

    fi

    if [ $ETC ]; then

        if [[ $EUID -ne 0 ]]; then
            echo "warning: skipping importing etc because script was not run as root"
        else

            echo "exporting etc"

            mkdir "etc"

            rsync -am "/etc/" "etc/"

            if [ $SYMLINKS ]; then
                tar -rf $PROFILE "etc" > /dev/null 2>&1
            else
                tar -rhf $PROFILE "etc" >/dev/null 2>&1
            fi

        fi

    fi

    if [ $DOTDIRS ]; then

        echo "exporting dot directories"

        mkdir "dotdirs"

        # this is even more absurd than XDG_CONFIG_HOME
        EXCLUDE=(
            "--exclude=.config/"
            # idk if this is really useful but yeah
            "--exclude=${XDG_CONFIG_HOME}"
            "--exclude=*.ssh"
            "--exclude=*gnupg"
            "--exclude=*gpg"
            "--exclude=.steam/"
            "--exclude=Steam/"
            "--exclude=.wine/"
            "--exclude=.cache/"
            "--exclude=pnpm/"
            "--exclude=packages/"
            "--exclude=node_modules/"
            "--exclude=src/"
            "--exclude=*.log"
            "--exclude=*.tmp"
            "--exclude=*cache*"
            "--exclude=*Cache*"
            "--exclude=session*"
            "--exclude=bin"
            "--exclude=bin32"
            "--exclude=bin64"
            "--exclude=lib"
            "--exclude=lib32"
            "--exclude=lib64"
            "--exclude=sdk32"
            "--exclude=sdk64"
        )

        # i'm sorry for this
        rsync "${EXCLUDE[@]}" -am --include=.*/*** --include=*/ --exclude=* $HOME/ dotdirs/

        if [ $SYMLINKS ]; then
            tar -rf $PROFILE "dotdirs" >/dev/null 2>&1
        else
            tar -rhf $PROFILE "dotdirs" >/dev/null 2>&1
        fi

    fi

    touch "cfgprf"
    tar -rf $PROFILE "cfgprf" >/dev/null

    rm -r $TEMP

    echo
    echo "finished exporting"
    echo

fi