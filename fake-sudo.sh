#!/bin/sh
# fake-sudo

shell=""

while [ $# -gt 0 ]; do
    case "$1" in
        --*=*)
		# convert --a=b → --a b
		a="${1%%=*}"; b="${1#*=}"
		shift
		set -- "$a" "$b" "$@"
		;;
	-h|--help)
		echo "usage: $0 [-u <user>] [<cmd> <arg>...]"
		exit 0
		;;
        -i|--login) 
		shell="/bin/sh -"
		shift
		;;
        -u|--user)
		echo "$0: ignoring user=$1" >&2 
		shift 2
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
		break
		;;
    esac
done

if [ -n "$shell" ]
then
  set -- $shell "$@"
fi 
exec unshare -r -- "$@"
