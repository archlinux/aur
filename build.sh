#!/bin/sh

set -euxo pipefail

help() {
    echo "Usage: $0 [clean|install|check]"
}

clean() {
    rm ./sigi-*.tar.gz ./sigi-*.tar.zst
    rm -r ./pkg ./src
}

install() {
    # Assumes you are on Arch, btw.
    makepkg
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

run() {
    case "$1" in
        clean)   clean   ;;
        install) install ;;
        check)   check   ;;
	*)       >&2 help
		 >&2 echo "Unknown target: $1"
		 exit 1 ;;
    esac
}

for cmd in "$@"
do
    run "$cmd"
done

