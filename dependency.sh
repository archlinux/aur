#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.logging
# endregion
# region functions
alias bl.dependency.check=bl_dependency_check
bl_dependency_check() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This function check if all given dependencies are present.

        >>> bl.dependency.check mkdir ls; echo $?
        0
        >>> bl.dependency.check mkdir __not_existing__ 1>/dev/null; echo $?
        2
        >>> bl.dependency.check __not_existing__ 1>/dev/null; echo $?
        2
        >>> bl.dependency.check "ls __not_existing__"; echo $?
        __not_existing__
        2
    '
    local return_code=0
    local dependency
    if ! hash &>/dev/null; then
        bl.logging.critical 'Missing dependency "hash" to check for available executables.'
        return 1
    fi
    for dependency in $@; do
        if ! hash "$dependency" &>/dev/null; then
            return_code=2
            echo "$dependency"
        fi
    done
    return $return_code
}
alias bl.dependency.check_pkgconfig=bl_dependency_check_pkgconfig
bl_dependency_check_pkgconfig() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This function check if all given libraries can be found.

        >>> bl.dependency.check_shared_library libc.so; echo $?
        0
        >>> bl.dependency.check_shared_library libc.so __not_existing__ 1>/dev/null; echo $?
        2
        >>> bl.dependency.check_shared_library __not_existing__ 1>/dev/null; echo $?
        2
    '
    local return_code=0
    local library

    if ! bl.dependency.check pkg-config &>/dev/null; then
        bl.logging.critical 'Missing dependency "pkg-config" to check for packages.'
        return 1
    fi
    for library in $@; do
        if ! pkg-config "$library" &>/dev/null; then
            return_code=2
            echo "$library"
        fi
    done
    return $return_code
}
alias bl.dependency.check_shared_library=bl_dependency_check_shared_library
bl_dependency_check_shared_library() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This function check if all given shared libraries can be found.

        >>> bl.dependency.check_shared_library libc.so; echo $?
        0
        >>> bl.dependency.check_shared_library libc.so __not_existing__ 1>/dev/null; echo $?
        2
        >>> bl.dependency.check_shared_library __not_existing__ 1>/dev/null; echo $?
        2
    '
    local return_code=0
    local pattern

    if ! bl.dependency.check ldconfig &>/dev/null; then
        bl.logging.critical 'Missing dependency "ldconfig" to check for shared libraries.'
        return 1
    fi
    for pattern in $@; do
        if ! ldconfig --print-cache | cut --fields 1 --delimiter ' ' | \
            grep "$pattern" &>/dev/null
        then
            return_code=2
            echo "$pattern"
        fi
    done
    return $return_code
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
