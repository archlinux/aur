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
# shellcheck disable=SC2016,SC2155
# shellcheck source=module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.globals
bl.module.import bashlink.string
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
            eval \
                '! [[ "${'"${1}"'-this_variable_is_undefined_!!!}"' \
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
    local file_name=index.sh
    if [[ $2 ]]; then
        file_name="$2"
    fi
    local relative_start_file_path=./index
    if [[ $3 ]]; then
        relative_start_file_path="$3"
    fi
    local directory_name="$(basename "$(readlink --canonicalize "$1")")"
    # NOTE: short option is necessary for mac compatibility.
    cat << EOF 1>"$file_name"
#!/usr/bin/env bash
executable_directory_path="\$(mktemp -d 2>/dev/null || mktemp -d -t '' 2>/dev/null)" && \\
data_offset="\$(("\$(grep --text --line-number '^exit \\\$?$' "\$0" | \\
    cut -d ':' -f 1)" + 1))" && \\
tail -n +\$dataOffset "\$0" | tar -xzf - -C "\$executableDirectory" \\
    1>/dev/null && \\
"\${executable_directory_path}/${directory_name}/${relative_start_file_path}" "\$@"
exit \$?
EOF
    local temporay_archiv_file_path="$(mktemp).tar.gz"
    tar --create --verbose --gzip --posix --file \
        "$temporary_archiv_file_path" "$1"
    cat "$temporary_archiv_file_path" 1>>"$file_name"
    chmod +x "$file_name"
    return $?
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
    local shebang_arguments=''
    local arguments=''
    local application_file_path=''
    local shebang_arguments_ended=false
    while true; do
        case "$1" in
            --)
                shebang_arguments_ended=true
                shift
                ;;
            '')
                shift
                break
                ;;
            *)
                if ! $shebang_arguments_ended; then
                    shebang_arguments+=" $(bl.string.validate_regular_expression_replacement "$1")"
                elif [ "$application_file_path" = '' ]; then
                    application_file_path="$1"
                else
                    arguments+=" $(bl.string.validate_regular_expression_replacement "$1")"
                fi
                shift
                ;;
        esac
    done
    local command="$(head --lines 1 "$application_file_path" | sed \
        --regexp-extended \
        's/^#!(.+)$/\1/g')$shebang_arguments $application_file_path $arguments"
    # NOTE: The following line could be useful for debugging scenarios.
    #echo "Run: \"$command\""
    eval "$command"
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
    local e_mail_address="$bl_globals_user_e_mail_address"
    if [ "$3" ]; then
        e_mail_address="$3"
    fi
    local date="$(date)"
    if [ "$4" ]; then
        date="$4"
    fi
    msmtp -t <<EOF
From: $e_mail_address
To: $e_mail_address
Reply-To: $e_mail_address
Date: $date
Subject: $1

$2

EOF
    return $?
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
