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
#	No warranty! For nothing. Use it at your own risk.
#===============================================================================
set -e
set -o nounset                              # Treat unset variables as an error

#================================== Logging ==================================
script_name=`basename "${BASH_SOURCE[0]}"`

# Backup stdout(&1) and stderr(&2) to fd 3 and fd 4
exec 3>&1 4>&2
# Restore stdout and stderr
trap 'exec 2>&4 1>&3' 0 1 2 3
# Use tee to redirect fd 1 to logfile.out and to stdout
exec 1> >(tee >(systemd-cat --identifier="$script_name" --priority="info") >&3)
# Use tee to redirect fd 2 to logfile.err and to stderr
exec 2> >(tee >(systemd-cat --identifier="$script_name" --priority="notice") >&4)

#================================= Functions =================================
function config_usage() {
    echo "Create your fetcher config file $configfile like this:"
    echo $HOME/workspace/repo pull
    echo $HOME/workspace/repo2 commit
    echo $HOME/workspace/repo2 push
    echo $HOME/.vim addcommitpush
    echo $HOME/workspace/project1 pull origin master:master
    echo $HOME/workspace/project2 alias
}

#============================== Parsing Options ==============================
dryrun=false
configfile="$HOME/.config/fetcher.conf"

for i in "$@"
do
case $i in
    -n|--dryrun)
    dryrun=true
    ;;
    -f=*|--file=*)
    configfile="${i#*=}"
    ;;
    -h|--help)
    echo $script_name' Options:'
    echo -h, --help     Show this information
    echo -n, --dryrun   Do a dry run
    echo -f=, --file=   Use another input file for fetcher
    echo
    config_usage
    exit
    ;;
    *)
            # unknown option
    ;;
esac
done

if [ ! -f $configfile ]; then
    echo "Configuration file \"$configfile\" not found." >&2
    config_usage
    exit
fi

#================================ Parse lines ================================
readarray -t lines < $configfile

if [ ${#lines[@]} -eq 0 ]; then
    config_usage
    exit
fi

for ((i=0; i < ${#lines[@]}; i++)); do
    line="${lines[$i]}"

    IFS=' ' read -r -a line <<< "$line"
    eval path=${line[0]}
    eval gitcmd=${line[1]}
    remote=''
    branch=''

    if [ ${#line[@]} -gt 2 ]; then
        eval remote=${line[2]}
    fi

    if [ ${#line[@]} -gt 3 ]; then
        eval branch=${line[3]}
    fi

    case $gitcmd in
        addcommitpush)
            if $dryrun; then
                cmd="git -C $path add -n -A"
                cmd="$cmd && git -C $path commit -n -v"
                cmd="$cmd; git -C $path push -n $remote $branch"
            else
                cmd="git -C $path add -A"
                cmd="$cmd && git -C $path commit -v"
                cmd="$cmd; git -C $path push $remote $branch"
            fi
            ;;
        pull)
            if $dryrun; then
                cmd="git -C $path pull --ff-only -n $remote $branch"
            else
                cmd="git -C $path pull --ff-only $remote $branch"
            fi
            ;;
        *)
            if $dryrun; then
                cmd="echo 'git -C $path $gitcmd $remote $branch'"
            else
                cmd="git -C $path $gitcmd $remote $branch"
            fi
            ;;
    esac

    echo '=============================================================================='
    echo "$script_name runs:"
    echo "$cmd"
    eval "$cmd" || true
    echo
done

echo '=============================================================================='
echo "fetcher processed successfully $configfile."
echo '=============================================================================='
