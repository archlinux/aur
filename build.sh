#!/bin/sh

set -euo pipefail

clean() {
    rm -f ./sigi-*.tar.gz ./sigi-*.tar.zst
    rm -rf ./pkg ./src
}

install() {
    # Assumes you are on Arch, btw.
    makepkg
    makepkg --printsrcinfo > .SRCINFO
}

check() {
    pkgdir="./pkg/sigi"
    if [ ! -x "$pkgdir/usr/bin/sigi" ]
    then
        >&2 echo "Sigi binary was not installed and executable"
	exit 1
    elif [ ! -f "$pkgdir/usr/share/man/man1/sigi.1.gz" ]
    then
	>&2 echo "Sigi man page was not installed"
	exit 1
    fi

    "$pkgdir"/usr/bin/sigi --version
}

bootstrap() {
    pacman -S git base-devel cargo
}

help() {
    echo "Usage: $0 [bootstrap|clean|install|check]..."
}

run() {
    case "$1" in
	bootstrap) bootstrap ;;
        clean)     clean   ;;
        install)   install ;;
        check)     check   ;;
	*)         >&2 help
	           >&2 echo "Unknown target: $1"
	           exit 1 ;;
    esac
}

# Exit with help message if no input.
if [ "$@unset" = unset ]
then
  help && exit
fi

set -x

# Handle all args as run commands.
for cmd in "$@"
do
    run "$cmd"
done

