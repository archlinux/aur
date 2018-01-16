#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region functions
alias bl.tools.is_defined=bl_tools_is_defined
bl_tools_is_defined() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Tests if variable is defined (can also be empty)

        >>> local foo="bar"
        >>> bl.tools.is_defined foo; echo $?
        >>> [[ -v foo ]]; echo $?
        0
        0
        >>> local defined_but_empty=""
        >>> bl.tools.is_defined defined_but_empty; echo $?
        0
        >>> bl.tools.is_defined undefined_variable; echo $?
        1
        >>> set -o nounset
        >>> bl.tools.is_defined undefined_variable; echo $?
        1
        Same Tests for bash < 4.3
        >>> bl_tools__bash_version_test=true
        >>> local foo="bar"
        >>> bl.tools.is_defined foo; echo $?
        0
        >>> bl_tools__bash_version_test=true
        >>> local defined_but_empty=""
        >>> bl.tools.is_defined defined_but_empty; echo $?
        0
        >>> bl_tools__bash_version_test=true
        >>> bl.tools.is_defined undefined_variable; echo $?
        1
        >>> bl_tools__bash_version_test=true
        >>> set -o nounset
        >>> bl.tools.is_defined undefined_variable; echo $?
        1
    '
    (
    set +o nounset
    if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 3)) \
            && [ -z "${bl_tools__bash_version_test:-}" ]; then
        [[ -v "${1:-}" ]] || exit 1
    else # for bash < 4.3
        # NOTE: ${varname:-foo} expands to foo if varname is unset or set to
        # the empty string; ${varname-foo} only expands to foo if varname is
        # unset.
        # shellcheck disable=SC2016
        eval '! [[ "${'"${1}"'-this_variable_is_undefined_!!!}"' \
            ' == "this_variable_is_undefined_!!!" ]]'
        exit $?
    fi
    )
}
alias bl.tools.is_empty=bl_tools_is_empty
bl_tools_is_empty() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Tests if variable is empty (undefined variables are not empty)

        >>> local foo="bar"
        >>> bl.tools.is_empty foo; echo $?
        1
        >>> local defined_and_empty=""
        >>> bl.tools.is_empty defined_and_empty; echo $?
        0
        >>> bl.tools.is_empty undefined_variable; echo $?
        1
        >>> set -u
        >>> bl.tools.is_empty undefined_variable; echo $?
        1
    '
    local variable_name="$1"
    bl.tools.is_defined "$variable_name" || return 1
    [ -z "${!variable_name}" ] || return 1
}
alias bl.tools.is_main=bl_tools_is_main
bl_tools_is_main() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Returns true if current script is being executed.

        NOTE: This test passes because `bl.tools.is_main` is called by
        "doctest.sh" which is being executed.

        >>> bl.tools.is_main && echo yes
        yes
    '
    [[ "${BASH_SOURCE[1]}" = "$0" ]]
}
alias bl.tools.unique=bl_tools_unique
bl_tools_unique() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        >>> local foo="a\nb\na\nb\nc\nb\nc"
        >>> echo -e "$foo" | bl.tools.unique
        a
        b
        c
    '
    nl "$@" | sort --key 2 | uniq --skip-fields 1 | sort --numeric-sort | \
        sed 's/\s*[0-9]\+\s\+//'
}
alias bl.tools.run_with_appended_shebang=bl_tools_run_with_appended_shebang
bl_tools_run_with_appended_shebang() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        This function reads and returns the shebang from given file if exist.

        ```bash
            /usr/bin/env python -O /path/to/script.py

            bl.tools.run_with_appended_shebang -O -- /path/to/script.py
        ```

        ```bash
            /usr/bin/env python -O /path/to/script.py argument1 argument2

            bl.tools.run_with_appended_shebang -O -- \
                /path/to/script.py \
                argument1 \
                argument2
        ```
    '
    local shebangArguments=''
    local arguments=''
    local applicationPath=''
    local shebangArgumentsEnded=false
    while true; do
        case "$1" in
            --)
                shebangArgumentsEnded=true
                shift
                ;;
            '')
                shift
                break
                ;;
            *)
                if ! $shebangArgumentsEnded; then
                    shebangArguments+=" $(validateBashArgument "$1")"
                elif [[ ! "$applicationPath" ]]; then
                    applicationPath="$1"
                else
                    arguments+=" $(validateBashArgument "$1")"
                fi
                shift
                ;;
        esac
    done
    local applicationRunCommand="$(head --lines 1 "$applicationPath" | sed \
        --regexp-extended \
        's/^#!(.+)$/\1/g')${shebangArguments} ${applicationPath} $arguments"
    # NOTE: The following line could be useful for debugging scenarios.
    #echo "Run: \"$applicationRunCommand\""
    eval "$applicationRunCommand"
    return $?
}
alias bl.tools.make_single_executbale=bl_tools_make_single_executable
bl_tools_make_single_executable() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Creates a bsd and virtually posix shell compatible single executable
        file from an application directory.

        ```bash
            bl.tools.make_single_executable /applicationDirectory startFile
        ```
    '
    if [[ ! "$1" ]]; then
        echo "Usage: $0 <DIRECTOTY_PATH> [EXECUTABLE_FILE_NAME] [RELATIVE_START_FILE_PATH]"
        exit 1
    fi
    local fileName='index.sh'
    if [[ "$2" ]]; then
        fileName="$2"
    fi
    local relativeStartFilePath='./index'
    if [[ "$3" ]]; then
        relativeStartFilePath="$3"
    fi
    local directoryName=$(basename $(readlink --canonicalize "$1"))
    # NOTE: short option is necessary for mac compatibility.
    cat << EOF 1>"$fileName"
#!/bin/bash
executableDirectory=\$(mktemp -d 2>/dev/null || mktemp -d -t '' 2>/dev/null)
dataOffset=\$((\$(grep --text --line-number '^exit \\\$?$' "\$0" | \\
    cut -d ':' -f 1) + 1))
tail -n +\$dataOffset "\$0" | tar -xzf - -C "\$executableDirectory" \\
    1>/dev/null && \\
"\${executableDirectory}/${directoryName}/${relativeStartFilePath}" "\$@"
exit \$?
EOF
    local tempArchiv=$(mktemp).tar.gz
    tar --create --verbose --gzip --posix --file "$tempArchiv" "$1" &&
    cat "$tempArchiv" 1>>"$fileName"
    chmod +x "$fileName"
    return $?
}
alias bl.tools.send_e_mail=bl_tools_send_e_mail
bl_tools_send_e_mail() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Sends an email.

        ```bash
            bl.tools.send_e_mail subject content address
        ```

        ```bash
            bl.tools.send_e_mail \
                subject \
                content \
                address \
                "Sun, 2 Feb 1986 14:23:56 +0100"
        ```
    '
    local eMailAddress="$ILU_ALTERNATE_USER_EMAIL_ADDRESS"
    if [ "$3" ]; then
        eMailAddress="$3"
    fi
    local date="$(date)"
    if [ "$4" ]; then
        date="$4"
    fi
    msmtp -t <<EOF
From: $eMailAddress
To: $eMailAddress
Reply-To: $eMailAddress
Date: $date
Subject: $1

$2

EOF
    return $?
}
alias bl.tools.make_openssl_pem_file=bl_tools_make_openssl_pem_file
bl_tools_make_openssl_pem_file() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Creates a concatenated pem file needed for server with https support.

        ```bash
            bl.tools.make_openssl_pem_file
        ```
    '
    local host='localhost'
    if [[ "$1" ]]; then
        host="$1"
    fi
    echo 'Create your private key without a password.'
    openssl genrsa -out "${host}.key" 1024
    echo 'Create a temporary csr file.'
    openssl req -new -key "${host}.key" -out "${host}.csr"
    echo 'Self-sign your certificate.'
    openssl x509 -req -days 365 -in "${host}.csr" -signkey "${host}.key" -out \
        "${host}.crt"
    echo 'Creating a pem file.'
    cat "${host}.key" "${host}.crt" 1>"${host}.pem"
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
