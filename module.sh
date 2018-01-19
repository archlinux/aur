#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# shellcheck disable=SC2016,SC2155
# Ensure to load module "module" once.
if [ ${#bl_module_imported[@]} -ne 0 ]; then
    return 0
fi
# Expand aliases in non interactive shells.
shopt -s expand_aliases
# region import
# shellcheck source=./path.sh
source "$(dirname "${BASH_SOURCE[0]}")/path.sh"
# endregion
# region variables
bl_module_allowed_names=(BASH_REMATCH COLUMNS HISTFILESIZE HISTSIZE LINES)
bl_module_allowed_scope_names=()
bl_module_bash_version_test=''
bl_module_declared_function_names_after_source=''
bl_module_declared_function_names_before_source_file_path=''
# shellcheck disable=SC2034
bl_module_declared_names_after_source=''
bl_module_declared_names_before_source_file_path=''
bl_module_directory_names_to_ignore=(apiDocumentation documentation node_modules)
bl_module_file_names_to_ignore=(package.json package-lock.json PKGBUILD readme.md)
bl_module_import_level=0
bl_module_imported=("$(bl.path.convert_to_absolute "${BASH_SOURCE[0]}")" "$(bl.path.convert_to_absolute "${BASH_SOURCE[1]}")" "$(bl.path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")/path.sh")")
bl_module_known_extensions=(.sh '' .zsh .csh .ksh .bash .shell)
bl_module_prevent_namespace_check=true
bl_module_scope_rewrites=('^bashlink([._][a-zA-Z_-]+)$/bl\1/')
# endregion
# region functions
alias bl.module.check_name=bl_module_check_name
bl_module_check_name() {
    local name="$1"
    local resolved_scope_name="$2"
    local alternate_resolved_scope_name="$(echo "$resolved_scope_name" | \
        sed --regexp-extended 's/\./_/g')"
    if ! [[ \
        "$name" =~ ^${resolved_scope_name}[_A-Z]* || \
        "$name" =~ ^${alternate_resolved_scope_name//\./\\./}[_A-Z]* \
    ]]; then
        local excluded=false
        if [[ -z "$3" ]]; then
            local excluded_pattern
            for excluded_pattern in "${bl_module_allowed_scope_names[@]}"; do
                if [[ $name =~ ^${excluded_pattern}[._A-Z]* ]]; then
                    excluded=true
                    break
                fi
            done
            if ! $excluded; then
                for excluded_pattern in "${bl_module_allowed_names[@]}"; do
                    if [[ "$excluded_pattern" = "$name" ]]; then
                        excluded=true
                        break
                    fi
                done
            fi
        fi
        if ! $excluded; then
            return 1
        fi
    fi
}
alias bl.module.determine_aliases=bl_module_determine_aliases
bl_module_determine_aliases() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Returns all defined aliases in the current scope.
    '
    alias | command grep '^alias' \
        | cut --delimiter ' ' --fields 2 - | cut --delimiter '=' --fields 1
}
alias bl.module.determine_declared_names=bl_module_determine_declared_names
bl_module_determine_declared_names() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Return all declared variables and function in the current scope.

        ```bash
            declarations="$(bl.module.determine_declared_names)"
        ```
    '
    local only_functions="${1:-}"
    [ -z "$only_functions" ] && only_functions=false
    {
        declare -F | cut --delimiter ' ' --fields 3
        $only_functions || \
        declare -p | command grep '^declare' | cut --delimiter ' ' --fields 3 - | \
            cut --delimiter '=' --fields 1
    } | sort --unique
}
alias bl.module.is_defined=bl_module_is_defined
bl_module_is_defined() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Tests if variable is defined (can also be empty)

        >>> local foo=bar
        >>> bl.module.is_defined foo; echo $?
        >>> [[ -v foo ]]; echo $?
        0
        0
        >>> local defined_but_empty=""
        >>> bl.module.is_defined defined_but_empty; echo $?
        0
        >>> bl.module.is_defined undefined_variable; echo $?
        1
        >>> set -o nounset
        >>> bl.module.is_defined undefined_variable; echo $?
        1

        # Same Tests for bash < 4.3
        >>> bl_module_bash_version_test=true
        >>> local foo="bar"
        >>> bl.module.is_defined foo; echo $?
        0
        >>> bl_module_bash_version_test=true
        >>> local defined_but_empty=""
        >>> bl.module.is_defined defined_but_empty; echo $?
        0
        >>> bl_module_bash_version_test=true
        >>> bl.module.is_defined undefined_variable; echo $?
        1
        >>> bl_module_bash_version_test=true
        >>> set -o nounset
        >>> bl.module.is_defined undefined_variable; echo $?
        1
    '
    (
        set +o nounset
        if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 3)) \
                && [ -z "$bl_module_bash_version_test" ]; then
            [[ -v "${1:-}" ]] || exit 1
        else # for bash < 4.3
            # NOTE: ${varname:-foo} expands to foo if varname is unset or set to
            # the empty string; ${varname-foo} only expands to foo if varname is
            # unset.
            # shellcheck disable=SC2016
            eval \
                '! [[ "${'"$1"'-this_variable_is_undefined_!!!}"' \
                ' == "this_variable_is_undefined_!!!" ]]'
            exit $?
        fi
    )
}
alias bl.module.is_imported=bl_module_is_imported
bl_module_is_imported() {
    local caller_file_path="${BASH_SOURCE[1]}"
    if (( $# == 2 )); then
        caller_file_path="$2"
    fi
    local file_path="$(bl.module.resolve "$1" "$caller_file_path")"
    # Check if module already loaded.
    local loaded_module
    for loaded_module in "${bl_module_imported[@]}"; do
        if [[ "$loaded_module" == "$file_path" ]]; then
            return 0
        fi
    done
    return 1
}
alias bl.module.log=bl_module_log
bl_module_log() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Logs arbitrary strings with given level.
    '
    if hash bl.logging.log &>/dev/null; then
        bl.logging.log "$@"
    elif [[ "$2" != '' ]]; then
        local level=$1
        shift
        echo "${level}: $*"
    else
        echo "info: $*"
    fi
}
# NOTE: Depends on "bl.module.log"
alias bl.module.import_raw=bl_module_import_raw
bl_module_import_raw() {
    bl_module_import_level=$((bl_module_import_level + 1))
    # shellcheck disable=SC1090
    source "$1"
    if [ $? = 1 ]; then
        bl.module.log critical "Failed to source module \"$1\"."
        return 1
    fi
    bl_module_import_level=$((bl_module_import_level - 1))
}
# NOTE: Depends on "bl.module.log"
alias bl.module.import_with_namespace_check=bl_module_import_with_namespace_check
bl_module_import_with_namespace_check() {
    # shellcheck disable=SC2016,SC2034
    local __documentation__='
        Sources a script and checks variable definitions before and after sourcing.
    '
    local file_path="$1"
    local resolved_scope_name="$2"
    local scope_name="$3"
    if (( bl_module_import_level == 0 )); then
        bl_module_declared_function_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-function-names-before-source)"
    fi
    bl_module_declared_function_names_after_source=''
    local declared_names_after_source_file_path="$(mktemp \
        --suffix=bashlink-module-declared-names-after-source)"
    # NOTE: All variables which are declared after "determine_declared_names"
    # will be interpreted as newly introduced variables from given module.
    local name
    bl.module.determine_declared_names \
        true \
        >"$bl_module_declared_function_names_before_source_file_path"
    # region do not declare variables area
    if [ "$bl_module_declared_names_before_source_file_path" = '' ]; then
        bl_module_declared_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-before-source)"
    fi
    ## region check if scope is clean before sourcing
    bl.module.determine_declared_names \
        >"$bl_module_declared_names_before_source_file_path"
    while read -r name ; do
        if bl.module.check_name "$name" "$resolved_scope_name" true; then
            bl.module.log warn \
                "Namespace \"$resolved_scope_name\" in \"$scope_name\" is" \
                "not clean: Name \"$name\" is already defined." \
                1>&2
        fi
    done < "$bl_module_declared_names_before_source_file_path"
    ## endregion
    bl.module.import_raw "$file_path"
    # Check if sourcing has introduced unprefixed names.
    bl.module.determine_declared_names >"$declared_names_after_source_file_path"
    # endregion
    local new_declared_names
    new_declared_names="$(! diff \
        "$bl_module_declared_names_before_source_file_path" \
        "$declared_names_after_source_file_path" | \
        command grep -e "^>" | sed 's/^> //'
    )"
    for name in $new_declared_names; do
        if ! bl.module.check_name "$name" "$resolved_scope_name"; then
            local alternate_resolved_scope_name="$(
                echo "$resolved_scope_name" | sed --regexp-extended 's/\./_/g'
            )"
            bl.module.log \
                warn \
                "Module \"$scope_name\" introduces a global unprefixed name:" \
                "\"$name\". Maybe it should be prefixed with \"" \
                "${resolved_scope_name}\" or \"" \
                "$alternate_resolved_scope_name\"." \
                1>&2
        fi
    done
    # Mark introduced names as checked.
    bl.module.determine_declared_names \
        >"$bl_module_declared_names_before_source_file_path"
    rm "$declared_names_after_source_file_path"
    # NOTE: This part is only needed for module introspection features.
    if (( bl_module_import_level == 0 )); then
        rm "$bl_module_declared_names_before_source_file_path"
        bl_module_declared_names_before_source_file_path=""
        bl_module_declared_function_names_after_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-names-after-source)"
        bl.module.determine_declared_names \
            true \
            >"$bl_module_declared_function_names_after_source_file_path"
        bl_module_declared_function_names_after_source="$(! diff \
            "$bl_module_declared_function_names_before_source_file_path" \
            "$bl_module_declared_function_names_after_source_file_path" | \
            command grep '^>' | sed 's/^> //'
        )"
        rm "$bl_module_declared_function_names_after_source_file_path"
        rm "$bl_module_declared_function_names_before_source_file_path"
    elif (( bl_module_import_level == 1 )); then
        bl.module.determine_declared_names true \
            >"$bl_module_declared_function_names_before_source_file_path"
    fi
}
# NOTE: Depends on "bl.module.import_raw" and "bl.module.import_with_namespace_check"
alias bl.module.import=bl_module_import
bl_module_import() {
    local caller_file_path="${BASH_SOURCE[1]}"
    if (( $# == 2 )); then
        caller_file_path="$2"
    fi
    if bl.module.is_imported "$1" "$caller_file_path"; then
        return 0
    fi
    # NOTE: We have to use "local" before to avoid shadowing the "$?" value.
    local result
    if result="$(bl.module.resolve "$1" true "$caller_file_path")"; then
        local file_path="$(echo "$result" | sed --regexp-extended 's:^(.+)/[^/]+$:\1:')"
        local scope_name="$(echo "$result" | sed --regexp-extended 's:^.*/([^/]+)$:\1:')"
        if [[ -d "$file_path" ]]; then
            local sub_file_path
            for sub_file_path in "${file_path}"/*; do
                local excluded=false
                local excluded_name
                for excluded_name in "${bl_module_directory_names_to_ignore[@]}"; do
                    if [[ -d "$sub_file_path" ]] && [ "$excluded_name" = "$(basename "$sub_file_path")" ]; then
                        excluded=true
                        break
                    fi
                done
                if ! $excluded; then
                    for excluded_name in "${bl_module_file_names_to_ignore[@]}"; do
                        if [[ -f "$sub_file_path" ]] && [ "$excluded_name" = "$(basename "$sub_file_path")" ]; then
                            excluded=true
                            break
                        fi
                    done
                fi
                if ! $excluded; then
                    # shellcheck disable=SC1117
                    local name="$(echo "$sub_file_path" | sed --regexp-extended "s:${scope_name}/([^/]+):${scope_name}.\1:")"
                    bl.module.import "$name" "$caller_file_path"
                fi
            done
        else
            bl_module_imported+=("$file_path")
            if $bl_module_prevent_namespace_check; then
                bl.module.import_raw "$file_path"
            else
                scope_name="$(bl.module.remove_known_file_extension "$scope_name")"
                bl.module.import_with_namespace_check \
                    "$file_path" \
                    "$(bl.module.rewrite_scope_name "$scope_name")" \
                    "$scope_name"
            fi
        fi
    else
        echo "$result" 1>&2
        return 1
    fi
}
alias bl.module.import_without_namespace_check=bl_module_import_without_namespace_check
bl_module_import_without_namespace_check() {
    local caller_file_path="${BASH_SOURCE[1]}"
    if (( $# == 2 )); then
        caller_file_path="$2"
    fi
    if bl.module.is_imported "$1" "$caller_file_path"; then
        return 0
    fi
    local file_path
    if file_path="$(bl.module.resolve "$1" "${BASH_SOURCE[1]}")"; then
        bl_module_imported+=("$file_path")
        bl.module.import_raw "$file_path"
    fi
}
alias bl.module.resolve=bl_module_resolve
bl_module_resolve() {
    # shellcheck disable=SC1004,SC2016,SC2034
    local __documentation__='
        NOTE: Do not use `bl.module.import` inside functions -> aliases do not
        work.

        >>> (
        >>> bl.module.import bashlink.logging
        >>> bl_logging_set_level warn
        >>> bl.module.import mockup/b false
        >>> )
        +bl.doctest.contains
        imported module c
        module "mockup_module_c" defines unprefixed name: "foo123"
        imported module b
        Modules should be imported only once.
        >>> (bl.module.import test/mockup_module_a.sh && \
        >>>     bl.module.import test/mockup_module_a.sh)
        imported module a
        >>> (
        >>> bl.module.import test/mockup_module_a.sh false
        >>> echo $bl_module_declared_function_names_after_source
        >>> )
        imported module a
        mockup_module_a_foo
        >>> (
        >>> bl.module.import bashlink.logging
        >>> bl.logging.set_level warn
        >>> bl.module.import test/mockup_module_c.sh false
        >>> echo $bl_module_declared_function_names_after_source
        >>> )
        +bl.doctest.contains
        imported module b
        imported module c
        module "mockup_module_c" defines unprefixed name: "foo123"
        foo123
    '
    local name="$1"
    local caller_path
    # shellcheck disable=SC2034
    bl_module_declared_function_names_after_source=''
    local current_path="$(dirname "$(dirname "$(bl.path.convert_to_absolute "${BASH_SOURCE[0]}")")")"
    if (( $# == 1 )) || [ "${!#}" = true ] || [ "${!#}" = false ]; then
        caller_path="$(dirname "$(bl.path.convert_to_absolute "${BASH_SOURCE[1]}")")"
    else
        caller_path="$(dirname "$(bl.path.convert_to_absolute "${!#}")")"
    fi
    local execution_path="$(dirname "$(bl.path.convert_to_absolute "${BASH_SOURCE[-1]}")")"
    local file_path=''
    while true; do
        local extension
        local extension_description=''
        for extension in "${bl_module_known_extensions[@]}"; do
            if [[ "$extension_description" != '' ]]; then
                extension_description+=', '
            fi
            extension_description+="\"$extension\""
            # Try absolute file path reference.
            if [[ "$name" = /* ]]; then
                if [[ -e "${name}${extension}" ]]; then
                    file_path="${name}${extension}"
                    break
                fi
            else
                # Try relative to caller file path reference.
                if [[ -e "${caller_path}/${name}${extension}" ]]; then
                    file_path="${caller_path}/${name}${extension}"
                    break
                fi
                # Try relative to executer file path reference.
                if [[ -e "${execution_path}/${name}${extension}" ]]; then
                    file_path="${execution_path}/${name}${extension}"
                    break
                fi
                local path
                # Try locations in "$PATH" listed references.
                for path in ${PATH//:/ }; do
                    if [[ -e "${path}/${name}${extension}" ]]; then
                        file_path="${path}/${name}${extension}"
                        break
                    fi
                done
                if [ "$file_path" != '' ]; then
                    break
                fi
            fi
            # Try to find module in this library or this whole library itself.
            if [[ -e "${current_path}/${name}${extension}" ]]; then
                file_path="${current_path}/${name}${extension}"
                break
            fi
        done
        if [ "$file_path" = '' ]; then
            local extension_pattern='('
            for extension in "${bl_module_known_extensions[@]}"; do
                extension_pattern+="$extension|"
            done
            extension_pattern+=')'
            # shellcheck disable=SC1117
            local new_name="$(echo "$name" | sed --regexp-extended "s:\.([^.]+?)(\.$extension_pattern)?$:/\1\2:")"
            if [ "$new_name" = "$name" ]; then
                break
            else
                name="$new_name"
            fi
        else
            break
        fi
    done
    if [ "$file_path" = '' ]; then
        bl.module.log \
            critical \
            "Module file path for \"$name\" could not be resolved for" \
            "\"${BASH_SOURCE[1]}\" in \"$caller_path\", \"$execution_path\"" \
            "or \"$current_path\" for one of the file extension:" \
            "${extension_description}."
        return 1
    fi
    if [ "$2" = true ]; then
        local scope_name="$(basename "$1")"
        if [[ "$file_path" == "$current_path"* ]] && [[ "$(basename "$1")" != bashlink.* ]]; then
            scope_name="bashlink.$(
                bl_module_remove_known_file_extension "$scope_name")"
        fi
        echo "$(bl.path.convert_to_absolute "$file_path")/$scope_name"
    else
        bl.path.convert_to_absolute "$file_path"
    fi
}
alias bl.module.remove_known_file_extension=bl_module_remove_known_file_extension
bl_module_remove_known_file_extension() {
    local name="$1"
    local extension
    for extension in "${bl_module_known_extensions[@]}"; do
        local result="${name%$extension}"
        if [[ "$name" != "$result" ]]; then
            echo "$result"
            return 0
        fi
    done
    echo "$1"
}
alias bl.module.rewrite_scope_name=bl_module_rewrite_scope_name
bl_module_rewrite_scope_name() {
    local resolved_scope_name="$1"
    for rewrite in "${bl_module_scope_rewrites[@]}"; do
        resolved_scope_name="$(echo "$resolved_scope_name" | \
            sed --regexp-extended "s/$rewrite")"
    done
    echo "$resolved_scope_name"
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
