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
if [ ${#module_imported[@]} -ne 0 ]; then
    return 0
fi
# Expand aliases in non interactive shells.
shopt -s expand_aliases
# region import
# shellcheck source=./path.sh
source "$(dirname "${BASH_SOURCE[0]}")/path.sh"
# endregion
# region variables
module_allowed_names='BASH_REMATCH COLUMNS HISTFILESIZE HISTSIZE LINES'
module_allowed_scope_names=''
module_declared_function_names_after_source=''
module_declared_function_names_after_source_file_name=''
module_declared_function_names_before_source_file_path=''
module_declared_names_after_source=''
module_declared_names_before_source_file_path=''
module_import_level=0
module_imported=("$(path.convert_to_absolute "${BASH_SOURCE[0]}")" "$(path.convert_to_absolute "${BASH_SOURCE[1]}")" "$(path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")/path.sh")")
module_suppress_declaration_warning=false
# endregion
# region functions
module_determine_declared_names() {
    # shellcheck disable=SC2016
    local __doc__='
    Return all declared variables and function in the current scope.
    E.g.
    `declarations="$(module.determine_declared_names)"`
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
alias module.determine_declared_names='module_determine_declared_names'
module_determine_aliases() {
    local __doc__='
    Returns all defined aliases in the current scope.
    '
    alias | grep '^alias' \
        | cut --delimiter ' ' --fields 2 - | cut --delimiter '=' --fields 1
}
alias module.determine_aliases="module_determine_aliases"
module_log() {
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
alias module.log='module_log'
module_import_raw() {
    module_import_level=$((module_import_level+1))
    source "$1"
    [ $? = 1 ] && module.log critical "Failed to source $1" && exit 1
    module_import_level=$((module_import_level-1))
}
alias module.import_raw='module_import_raw'
module_source_with_namespace_check() {
    local __doc__='
    Sources a script and checks variable definitions before and after sourcing.
    '
    local module_file_path="$1"
    local scope_name="$2"
    if (( module_import_level == 0 )); then
        module_declared_function_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-function-names-before-source)"
    fi
    module_determine_declared_names \
        true \
        >"$module_declared_function_names_before_source_file_path"
    local declared_names_after_source_file_path="$(mktemp \
        --suffix=bashlink-module-declared-names-after-source)"
    if [ "$module_declared_names_before_source_file_path" = "" ]; then
        module_declared_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-before-source)"
    fi
    # region check if scope is clean before sourcing
    local name
    module_determine_declared_names \
        >"$module_declared_names_before_source_file_path"
    while read -r name ; do
        if [[ $name =~ ^${scope_name}[._]* ]]; then
            module.log warn \
                "Namespace \"$scope_name\" is not clean: Name \"$name\" is" \
                "already defined." \
                1>&2
        fi
    done < "$module_declared_names_before_source_file_path"
    # endregion
    module.import_raw "$module_file_path"
    # Check if sourcing has introduced unprefixed names.
    module_determine_declared_names >"$declared_names_after_source_file_path"
    local new_declared_names
    if ! $module_suppress_declaration_warning; then
        new_declared_names="$(echo "$(! diff \
            "$module_declared_names_before_source_file_path" \
            "$declared_names_after_source_file_path" | \
            grep -e "^>" | sed 's/^> //'
        )" | sed 's/[0-9]*:> //g')"
        for name in $new_declared_names; do
            if ! [[ $name =~ ^${scope_name}[._A-Z]* ]]; then
                local excluded=false
                local excluded_pattern
                for excluded_pattern in $module_allowed_scope_names; do
                    if [[ $name =~ ^${excluded_pattern}[._A-Z]* ]]; then
                        excluded=true
                        break
                    fi
                done
                if ! $excluded; then
                    for excluded_pattern in $module_allowed_names; do
                        if [[ "$excluded_pattern" = "$name" ]]; then
                            excluded=true
                            break
                        fi
                    done
                fi
                if ! $excluded; then
                    module.log \
                        warn \
                        "Module \"$scope_name\" introduces a global" \
                        "unprefixed name: \"$name\"." \
                        1>&2
                fi
            fi
        done
    fi
    # Mark introduced names as checked.
    module_determine_declared_names \
        >"$module_declared_names_before_source_file_path"
    rm "$declared_names_after_source_file_path"
    # NOTE: This part is only needed for module introspection features.
    if (( module_import_level == 0 )); then
        rm "$module_declared_names_before_source_file_path"
        module_declared_names_before_source_file_path=""
        module_declared_function_names_after_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-after-source)"
        module_determine_declared_names \
            true \
            >"$module_declared_function_names_after_source_file_path"
        module_declared_function_names_after_source="$(echo "$(! diff \
            "$module_declared_function_names_before_source_file_path" \
            "$module_declared_function_names_after_source_file_path" | \
            grep '^>' | sed 's/^> //'
        )" | sed 's/[0-9]*:> //g')"
        rm "$module_declared_function_names_after_source_file_path"
        rm "$module_declared_function_names_before_source_file_path"
    elif (( module_import_level == 1 )); then
        module.determine_declared_names true \
            >"$module_declared_function_names_before_source_file_path"
    fi
}
alias module.source_with_namespace_check='module_source_with_namespace_check'
module_resolve() {
    # shellcheck disable=SC2016,SC1004
    local __doc__='
    IMPORTANT: Do not use "module.import" inside functions -> aliases do not work
    TODO: explain this in more detail
    >>> (
    >>> module.import logging
    >>> logging_set_level warn
    >>> module.import test/mockup_module-b.sh false
    >>> )
    +doctest_contains
    imported module c
    module "mockup_module_c" defines unprefixed name: "foo123"
    imported module b
    Modules should be imported only once.
    >>> (module.import test/mockup_module_a.sh && \
    >>>     module.import test/mockup_module_a.sh)
    imported module a
    >>> (
    >>> module.import test/mockup_module_a.sh false
    >>> echo $module_declared_function_names_after_source
    >>> )
    imported module a
    mockup_module_a_foo
    >>> (
    >>> module.import logging
    >>> logging_set_level warn
    >>> module.import test/mockup_module_c.sh false
    >>> echo $module_declared_function_names_after_source
    >>> )
    +doctest_contains
    imported module b
    imported module c
    module "mockup_module_c" defines unprefixed name: "foo123"
    foo123
    '
    local module="$1"
    local suppress_declaration_warning="${2:-}"
    # If "$suppress_declaration_warning" is empty do not change the current value
    # of "$module_suppress_declaration_warning". (So it is not changed by nested
    # imports.)
    if [[ "$suppress_declaration_warning" == true ]]; then
        module_suppress_declaration_warning=true
    elif [[ "$suppress_declaration_warning" == false ]]; then
        module_suppress_declaration_warning=false
    fi
    local module_file_path=''
    # shellcheck disable=SC2034
    module_declared_function_names_after_source=''

    local current_path="$(path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")")"
    local caller_path
    caller_path="$(path.convert_to_absolute "$(dirname "${BASH_SOURCE[1]}")")"
    local extensions='sh bash shell zsh csh'
    # Try absolute file path reference.
    if [[ "$module" = /* ]]; then
        if [[ -f "$module" ]]; then
            module_file_path="$module"
        else
            for extension in $extensions; do
                if [[ -f "${module}.${extension}" ]]; then
                    module_file_path="${module}.${extension}"
                    break
                fi
            done
        fi
    fi
    if [[ "$module_file_path" = '' ]]; then
        # Try relative file path reference.
        if [[ -f "${caller_path}/${module}" ]]; then
            module_file_path="${caller_path}/${module}"
        else
            local extension
            for extension in $extensions; do
                if [[ -f "${caller_path}/${module}.${extension}" ]]; then
                    module_file_path="${caller_path}/${module}.${extension}"
                    break
                fi
            done
        fi
    fi
    if [ "$module_file_path" == '' ]; then
        local path
        # Try "$PATH" file path reference.
        for path in ${PATH//:/ }; do
            if [[ -f "${path}/${module}" ]]; then
                module_file_path="${path}/${module}"
                break
            else
                local extension
                for extension in $extensions; do
                    if [[ -f "${path}/${module}.${extension}" ]]; then
                        module_file_path="${path}/${module}.${extension}"
                        break
                    fi
                done
                if [ "$module_file_path" != '' ]; then
                    break
                fi
            fi
        done
    fi
    if [ "$module_file_path" == '' ]; then
        # Try bashLink file path reference.
        if [[ -f "${current_path}/${module%.sh}.sh" ]]; then
            module_file_path="${current_path}/${module%.sh}.sh"
        fi
    fi
    if [ "$module_file_path" == '' ]; then
        module.log \
            critical \
            "Module file path for \"$module\" could not be resolved to" \
            "for \"${BASH_SOURCE[1]}\" in \"$caller_path\"."
        return 1
    fi
    echo "$(path.convert_to_absolute "$module_file_path")"
}
alias module.resolve='module_resolve'
module_is_loaded() {
    local module_file_path="$(module.resolve "$1")"
    # Check if module already loaded.
    local loaded_module
    for loaded_module in "${module_imported[@]}"; do
        if [[ "$loaded_module" == "$module_file_path" ]]; then
            return 0
        fi
    done
    return 1
}
alias module.is_loaded='module_is_loaded'
module_import_without_namespace_check() {
    if module.is_loaded "$1"; then
        return 0
    fi
    local module_file_path="$(module.resolve "$1")"
    module_imported+=("$module_file_path")
    module.import_raw "$module_file_path"
    # Mark introduced names as "checked".
    module_determine_declared_names \
        >"$module_declared_names_before_source_file_path"
}
alias module.import_without_namespace_check='module_import_without_namespace_check'
module_import() {
    if module.is_loaded "$1"; then
        return 0
    fi
    local module_file_path="$(module.resolve "$1")"
    module="$(basename "$module_file_path")"
    module_imported+=("$module_file_path")
    module.source_with_namespace_check "$module_file_path" "${module%.sh}"
}
alias module.import='module_import'
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
