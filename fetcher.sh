#!/bin/bash
#===============================================================================
#        AUTHOR: Manoel Brunnen, manoel.brunnen@gmail.com
#       CREATED: 21.07.2016
#       LICENSE: MIT
#          FILE: fetcher.sh
#         USAGE: ./fetcher.sh
#
#   DESCRIPTION: update some git repos
#
#       No warranty! For nothing. Use it at your own risk.
#===============================================================================
set -e
set -u

#================================== Logging ==================================
script_name="$(basename "${BASH_SOURCE[0]}")"
configfile="$HOME/.config/fetcher.conf"

# Backup stdout(&1) and stderr(&2) to fd 3 and fd 4
exec 3>&1 4>&2
# Restore stdout and stderr
trap 'exec 2>&4 1>&3' 0 1 2 3
# Use tee to redirect fd 1 to logfile.out and to stdout
exec 1> >(tee >(systemd-cat --identifier="$script_name" --priority="info") >&3)
# Use tee to redirect fd 2 to logfile.err and to stderr
exec 2> >(tee >(systemd-cat --identifier="$script_name" --priority="notice") >&4)

#================================= Functions =================================
function help_menu() {
    echo "$script_name Options:"
    echo -h, --help     Show this information
    echo -f=, --file=   Use another input file for fetcher
    echo
    echo "Create your fetcher config file $configfile like this:"
    echo "$HOME/workspace/repo pull --ff-only"
    echo "$HOME/workspace/repo2 pull origin master:master"
    echo "$HOME/workspace/repo2 push"
    echo
}

#============================== Parsing Options ==============================

for i in "$@"
do
    case $i in
        -f=*|--file=*)
            configfile="${i#*=}"
            ;;
        -h|--help)
            help_menu
            exit
            ;;
        *)
            # unknown option
            ;;
    esac
done

if [ ! -f "$configfile" ]; then
    echo "Configuration file \"$configfile\" not found." >&2
    echo
    help_menu
    exit
fi

#================================ Parse lines ================================
readarray lines < "$configfile"

if [ ${#lines[@]} -eq 0 ]; then
    echo "Configuration file \"$configfile\" empty." >&2
    echo
    help_menu
    exit
fi

for i in "${lines[@]}"; do
    IFS=' ' read -r -a line <<< "$i"
    path="${line[0]}"
    args=$(IFS=' '; echo "${line[@]:1}")

    cmd="git -C $path $args"
    echo "Running: $cmd"
    eval "$cmd" || true
    echo
done
