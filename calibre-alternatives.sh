#!/bin/sh

libdir=/usr/lib/calibre
bindir=/usr/lib/calibre/bin

die() {
    echo "${1}" >&2
    exit 1
}

usage() {
    cat <<- __EOF__
	usage: calibre-alternatives [help|get]
	usage: calibre-alternatives set [2|3]

	Set the default python interpreter for calibre, either python2 or python3.
__EOF__
}

get_current() {
    currentdir=$(readlink "${libdir}/bin")
    echo "${currentdir##*-py}"
}

find_alternative() {
    for i in 2 3; do
        if [ -d "${libdir}/bin-py${i}" ]; then
            echo "${i}"
            return 0
        fi
    done
    return 1
}

set_current() {
    alt=${1}
    if [ -z "${alt}" ]; then
        [ -z "$(get_current)" ] || exit 0 # nothing to do
        alt=$(find_alternative) || die "error: no alternatives exist"
    fi

    if ! [ $(id -u) = 0 ]; then
        die "error: cannot set without being root"
    fi

    if [ -d "${libdir}/bin-py${alt}" ]; then
        ln -snvf bin-py${alt} "${libdir}/bin"
    else
        die "alternative '${alt}' does not exist"
    fi
}

case ${1} in
    help)
        usage;;
    ''|get)
        get_current;;
    set)
        shift; set_current "${1}";;
    *)
        die "invalid option: '${1}'"
esac
