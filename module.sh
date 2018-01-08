#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# Ensure to load module "module" once.
if [ ${#bashlink_module_imported[@]} -ne 0 ]; then
    return 0
fi
# Expand aliases in non interactive shells.
shopt -s expand_aliases
# region import
# shellcheck source=./path.sh
source "$(dirname "${BASH_SOURCE[0]}")/path.sh"
# endregion
# region variables
bashlink_module_allowed_names=(BASH_REMATCH COLUMNS EDITOR HISTFILESIZE HISTSIZE LINES)
bashlink_module_allowed_scope_names=()
bashlink_module_declared_function_names_after_source=''
bashlink_module_declared_function_names_after_source_file_name=''
bashlink_module_declared_function_names_before_source_file_path=''
bashlink_module_declared_names_after_source=''
bashlink_module_declared_names_before_source_file_path=''
bashlink_module_import_level=0
bashlink_module_imported=("$(path.convert_to_absolute "${BASH_SOURCE[0]}")" "$(path.convert_to_absolute "${BASH_SOURCE[1]}")" "$(path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")/path.sh")")
bashlink_module_known_extensions=('' .sh .bash .shell .zsh .csh)
bashlink_module_suppress_declaration_warning=false
# endregion
# region functions
bashlink_module_determine_declared_names() {
    # shellcheck disable=SC2016
    local __doc__='
    Return all declared variables and function in the current scope.
    E.g.
    `declarations="$(bashlink.module.determine_declared_names)"`
    '
    local only_functions="${1:-}"
    [ -z "$only_functions" ] && only_functions=false
    {
        declare -F | cut --delimiter ' ' --fields 3
        $only_functions || \
        declare -p | grep '^declare' | cut --delimiter ' ' --fields 3 - | \
            cut --delimiter '=' --fields 1
    } | sort --unique
}
alias bashlink.module.determine_declared_names=bashlink_module_determine_declared_names
bashlink_module_determine_aliases() {
    local __doc__='
    Returns all defined aliases in the current scope.
    '
    alias | grep '^alias' \
        | cut --delimiter ' ' --fields 2 - | cut --delimiter '=' --fields 1
}
alias bashlink.module.determine_aliases=bashlink_module_determine_aliases
bashlink_module_log() {
    local __doc__='
    Logs arbitrary strings with given level.
    '
    if hash logging.log &>/dev/null; then
        logging.log "$@"
    elif [[ "$2" != '' ]]; then
        local level=$1
        shift
        echo "$level": "$@"
    else
        echo "info": "$@"
    fi
}
alias bashlink.module.log=bashlink_module_log
bashlink_module_import_raw() {
    bashlink_module_import_level=$((bashlink_module_import_level+1))
    source "$1"
    [ $? = 1 ] && \
        bashlink.module.log critical "Failed to source module \"$1\"." && \
        return 1
    bashlink_module_import_level=$((bashlink_module_import_level-1))
}
alias bashlink.module.import_raw=bashlink_module_import_raw
bashlink_module_source_with_namespace_check() {
    local __doc__='
    Sources a script and checks variable definitions before and after sourcing.
    '
    local file_path="$1"
    local scope_name="$2"
    if (( bashlink_module_import_level == 0 )); then
        bashlink_module_declared_function_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-function-names-before-source)"
    fi
    # NOTE: All variables which are declared after "determine_declared_names"
    # will be interpreted as newly introduced variables from given module.
    local name
    local declared_names_after_source_file_path="$(mktemp \
        --suffix=bashlink-module-declared-names-after-source)"
    bashlink.module.determine_declared_names \
        true \
        >"$bashlink_module_declared_function_names_before_source_file_path"
    # region do not declare variables
    if [ "$bashlink_module_declared_names_before_source_file_path" = '' ]; then
        bashlink_module_declared_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-before-source)"
    fi
    ## region check if scope is clean before sourcing
    bashlink.module.determine_declared_names \
        >"$bashlink_module_declared_names_before_source_file_path"
    while read -r name ; do
        if [[ $name =~ ^${scope_name}[._]* ]]; then
            bashlink.module.log warn \
                "Namespace \"$scope_name\" is not clean: Name \"$name\" is" \
                "already defined." \
                1>&2
        fi
    done < "$bashlink_module_declared_names_before_source_file_path"
    ## endregion
    bashlink.module.import_raw "$file_path"
    # Check if sourcing has introduced unprefixed names.
    bashlink.module.determine_declared_names >"$declared_names_after_source_file_path"
    # endregion
    local new_declared_names
    if ! $bashlink_module_suppress_declaration_warning; then
        new_declared_names="$(echo "$(! diff \
            "$bashlink_module_declared_names_before_source_file_path" \
            "$declared_names_after_source_file_path" | \
            grep -e "^>" | sed 's/^> //'
        )" | sed 's/[0-9]*:> //g')"
        for name in $new_declared_names; do
            if ! [[ $name =~ ^${scope_name//\./\\\\./}[._A-Z]* ]]; then
                local excluded=false
                local excluded_pattern
                for excluded_pattern in "${bashlink_module_allowed_scope_names[@]}"; do
                    if [[ $name =~ ^${excluded_pattern}[._A-Z]* ]]; then
                        excluded=true
                        break
                    fi
                done
                if ! $excluded; then
                    for excluded_pattern in "${bashlink_module_allowed_names[@]}"; do
                        if [[ "$excluded_pattern" = "$name" ]]; then
                            excluded=true
                            break
                        fi
                    done
                fi
                if ! $excluded; then
                    bashlink.module.log \
                        warn \
                        "Module \"$scope_name\" introduces a global" \
                        "unprefixed name: \"$name\". Maybe it should be " \
                        "named as \"${scope_name}.${name}\"." \
                        1>&2
                fi
            fi
        done
    fi
    # Mark introduced names as checked.
    bashlink.module.determine_declared_names \
        >"$bashlink_module_declared_names_before_source_file_path"
    rm "$declared_names_after_source_file_path"
    # NOTE: This part is only needed for module introspection features.
    if (( bashlink_module_import_level == 0 )); then
        rm "$bashlink_module_declared_names_before_source_file_path"
        bashlink_module_declared_names_before_source_file_path=""
        bashlink_module_declared_function_names_after_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-after-source)"
        bashlink.module.determine_declared_names \
            true \
            >"$bashlink_module_declared_function_names_after_source_file_path"
        bashlink_module_declared_function_names_after_source="$(echo "$(! diff \
            "$bashlink_module_declared_function_names_before_source_file_path" \
            "$bashlink_module_declared_function_names_after_source_file_path" | \
            grep '^>' | sed 's/^> //'
        )" | sed 's/[0-9]*:> //g')"
        rm "$bashlink_module_declared_function_names_after_source_file_path"
        rm "$bashlink_module_declared_function_names_before_source_file_path"
    elif (( bashlink_module_import_level == 1 )); then
        bashlink.module.determine_declared_names true \
            >"$bashlink_module_declared_function_names_before_source_file_path"
    fi
}
alias bashlink.module.source_with_namespace_check=bashlink_module_source_with_namespace_check
bashlink_module_resolve() {
    # shellcheck disable=SC2016,SC1004
    local __doc__='
    IMPORTANT: Do not use "bashlink.module.import" inside functions -> aliases do not work
    TODO: explain this in more detail
    >>> (
    >>> bashlink.module.import logging
    >>> logging_set_level warn
    >>> bashlink.module.import test/mockup_module-b.sh false
    >>> )
    +doctest_contains
    imported module c
    module "mockup_module_c" defines unprefixed name: "foo123"
    imported module b
    Modules should be imported only once.
    >>> (bashlink.module.import test/mockup_module_a.sh && \
    >>>     bashlink.module.import test/mockup_module_a.sh)
    imported module a
    >>> (
    >>> bashlink.module.import test/mockup_module_a.sh false
    >>> echo $bashlink_module_declared_function_names_after_source
    >>> )
    imported module a
    mockup_module_a_foo
    >>> (
    >>> bashlink.module.import logging
    >>> logging_set_level warn
    >>> bashlink.module.import test/mockup_module_c.sh false
    >>> echo $bashlink_module_declared_function_names_after_source
    >>> )
    +doctest_contains
    imported module b
    imported module c
    module "mockup_module_c" defines unprefixed name: "foo123"
    foo123
    '
    local name="$1"
    local suppress_declaration_warning="${2:-}"
    # If "$suppress_declaration_warning" is empty do not change the current
    # value of "$bashlink_module_suppress_declaration_warning". (So it is not changed by
    # nested imports.)
    if [[ "$suppress_declaration_warning" == true ]]; then
        bashlink_module_suppress_declaration_warning=true
    elif [[ "$suppress_declaration_warning" == false ]]; then
        bashlink_module_suppress_declaration_warning=false
    fi
    # shellcheck disable=SC2034
    bashlink_module_declared_function_names_after_source=''
    local current_path="$(path.convert_to_absolute "$(dirname "$(dirname "${BASH_SOURCE[0]}")")")"
    local caller_path="$(path.convert_to_absolute "$(dirname "${BASH_SOURCE[1]}")")"
    local file_path=''
    while true; do
        local extension
        for extension in "${bashlink_module_known_extensions[@]}"; do
            # Try absolute file path reference.
            if [[ "$name" = /* ]]; then
                if [[ -f "${name}${extension}" ]]; then
                    file_path="${name}${extension}"
                    break
                fi
            else
                # Try relative file path reference.
                if [ "$file_path" = '' ] && [[ -f "${caller_path}/${name}${extension}" ]]; then
                    file_path="${caller_path}/${name}${extension}"
                    break
                fi
                if [ "$file_path" = '' ]; then
                    local path
                    # Try "$PATH" file path reference.
                    for path in ${PATH//:/ }; do
                        if [[ -f "${path}/${name}${extension}" ]]; then
                            file_path="${path}/${name}${extension}"
                            break
                        fi
                        if [ "$file_path" != '' ]; then
                            break
                        fi
                    done
                fi
            fi
        done
        # Try to finde module in this library.
        if [ "$file_path" == '' ] && [[ -f "${current_path}/${name%.sh}.sh" ]]; then
            file_path="${current_path}/${name%.sh}.sh"
        fi
        if [ "$file_path" == '' ] && echo "$name" | grep '\.' &>/dev/null; then
            name="$(echo "$name" | sed --regexp-extended s:.\([^.]+\)$:/\\1:)"
        else
            break
        fi
    done
    if [ "$file_path" == '' ]; then
        bashlink.module.log \
            critical \
            "Module file path for \"$name\" could not be resolved for" \
            "\"${BASH_SOURCE[1]}\" in \"$caller_path\"."
        return 1
    fi
    if [ "$2" = true ]; then
        echo "$(path.convert_to_absolute "$file_path")/$(basename "$1")"
    else
        echo "$(path.convert_to_absolute "$file_path")"
    fi
}
alias bashlink.module.resolve=bashlink_module_resolve
bashlink_module_is_loaded() {
    local file_path="$(bashlink.module.resolve "$1")"
    # Check if module already loaded.
    local loaded_module
    for loaded_module in "${bashlink_module_imported[@]}"; do
        if [[ "$loaded_module" == "$file_path" ]]; then
            return 0
        fi
    done
    return 1
}
alias bashlink.module.is_loaded=bashlink_module_is_loaded
bashlink_module_import_without_namespace_check() {
    if bashlink.module.is_loaded "$1"; then
        return 0
    fi
    local file_path="$(bashlink.module.resolve "$1")"
    bashlink_module_imported+=("$file_path")
    bashlink.module.import_raw "$file_path"
    # Mark introduced names as "checked".
    bashlink.module.determine_declared_names \
        >"$bashlink_module_declared_names_before_source_file_path"
}
alias bashlink.module.import_without_namespace_check=bashlink_module_import_without_namespace_check
bashlink_module_import() {
    if bashlink.module.is_loaded "$1"; then
        return 0
    fi
    # NOTE: We have to use "local" before to avoid shadowing the "$?" value.
    local result
    result="$(bashlink.module.resolve "$1" true)"
    local return_code=$?
    if (( return_code == 0 )); then
        local file_path="$(echo "$result" | sed --regexp-extended s:^\(.+\)/[^/]+$:\\1:)"
        local scope_name="$(echo "$result" | sed --regexp-extended s:^.*/\([^/]+\)$:\\1:)"
        bashlink_module_imported+=("$file_path")
        bashlink.module.source_with_namespace_check "$file_path" "${scope_name%.sh}"
    else
        echo "$result"
    fi
}
alias bashlink.module.import=bashlink_module_import
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
