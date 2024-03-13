#!/usr/bin/env bash
set -euo pipefail

function usage {
    echo "gnome-screenshot-$(tput bold; tput setaf 3)stub$(tput sgr0): $*"
    exit 64 # /usr/include/sysexits.h: EX_USAGE
}

grimOpt=()
grimFile=""

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -p) grimOpt+=("-c") ;;

        --file=*) grimFile="${1#--file=}" ;;

        -f|--file)
            if [[ "$#" -lt 2 ]]; then usage "expected an argument: $1"; fi

            grimFile="$2";
            shift
        ;;
        *) usage "invalid or unsupported option: $1" ;;
    esac
    shift
done

if [[ $grimFile ]]; then
    grimOpt+=("--" "$grimFile")
fi

grim "${grimOpt[@]}"
