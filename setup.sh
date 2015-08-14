#!/bin/bash

usage()
{
	cat <<- _EOF_
		Usage: ./setup.sh [OPTIONS] COMMAND...
		Set up infrastructure for tracking PKGBUILDs.

		OPTIONS
		    -h, --help          show this usage message

		COMMANDS
		    ssh [/path/to/key]  add/replace ssh-config rules.
		                          Key defaults to '~/.ssh/keys/aur'
		    hooks               link hooks from repo root to
		                          githooks directory. Must be
		                          run from repo root.
_EOF_
}

ssh() {
    echo "Adding ssh-config rules (this will clear previous rules for 'aur')..."
    sed -ri '/^Host aur(( aur)?.*\.archlinux\.org)?$/,+3d' ~/.ssh/config
	cat <<- _EOF_ >> ~/.ssh/config
		Host aur aur.archlinux.org
		    User aur
		    Hostname aur.archlinux.org
		    IdentityFile ${keypath}
_EOF_
}

hooks() {
    echo "Adding commit hooks..."
    shopt -s nullglob
    for hook in *.hook; do
        ln -sf "$(pwd)/${hook}" ".git/hooks/${hook%.hook}"
    done
}

if [[ $# -eq 0 ]]; then
    echo "error: No arguments passed."
    echo "Try '${0} --help' for more information."
    exit 1
fi
while [[ "${1}" != "" ]]; do
    case ${1} in
        -h|--help)
            usage
            exit
            ;;
        ssh)
            shift
            keypath="${1:-~/.ssh/keys/aur}"
            ssh
            ;;
        hooks)
            hooks
            ;;
        *)
            echo "${0}: unrecognized option '${1}'"
            echo "Try '${0} --help' for more information."
            exit 1
    esac
    shift
done
