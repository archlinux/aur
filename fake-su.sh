#!/bin/sh
# fake-su

cmd=""
shell="/bin/sh"

while [ $# -gt 0 ]; do
    case "$1" in
        -h|--help)
		echo "usage: $0 [-l] [-] [<user> [<arg>...]]"
		exit 0
		;;
        -|-l|--login) 
		shell="$shell -"; shift
		;;
        -c|--command)
		cmd="$2"; shift 2
		;;
        --)     
		shift
		break
		;;
        -*)     
		echo "$0: invalid option: $1" >&2
		exit 1
		;;
        *)      
		echo "$0: ignoring user=$1" >&2
		shift
		break
		;;
    esac
done

if [ -z "$cmd" ]
then
   exec unshare -r -- "$shell" "$@"
else
   exec unshare -r -- "$shell" -c "$cmd" "$@"
fi
