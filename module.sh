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
bl_module_declared_function_names_after_source=''
bl_module_declared_function_names_after_source_file_name=''
bl_module_declared_function_names_before_source_file_path=''
bl_module_declared_names_after_source=''
bl_module_declared_names_before_source_file_path=''
bl_module_directory_names_to_ignore=(node_modules)
bl_module_file_names_to_ignore=(package.json package-lock.json PKGBUILD readme.md)
bl_module_import_level=0
bl_module_imported=("$(bl.path.convert_to_absolute "${BASH_SOURCE[0]}")" "$(bl.path.convert_to_absolute "${BASH_SOURCE[1]}")" "$(bl.path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")/path.sh")")
bl_module_known_extensions=(.sh '' .bash .shell .zsh .csh)
bl_module_prevent_namespace_check=false
bl_module_scope_rewrites=('^bashlink([._][a-zA-Z_-]+)$/bl\1/')
# endregion
# region functions
alias bl.module.determine_declared_names=bl_module_determine_declared_names
bl_module_determine_declared_names() {
    # shellcheck disable=SC2016
    local __doc__='
    Return all declared variables and function in the current scope.
    E.g.
    `declarations="$(bl.module.determine_declared_names)"`
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
alias bl.module.determine_aliases=bl_module_determine_aliases
bl_module_determine_aliases() {
    local __doc__='
    Returns all defined aliases in the current scope.
    '
    alias | grep '^alias' \
        | cut --delimiter ' ' --fields 2 - | cut --delimiter '=' --fields 1
}
alias bl.module.log=bl_module_log
bl_module_log() {
    local __doc__='
    Logs arbitrary strings with given level.
    '
    if hash bl.logging.log &>/dev/null; then
        bl.logging.log "$@"
    elif [[ "$2" != '' ]]; then
        local level=$1
        shift
        echo "$level": "$@"
    else
        echo "info": "$@"
    fi
}
alias bl.module.import_raw=bl_module_import_raw
bl_module_import_raw() {
    bl_module_import_level=$((bl_module_import_level+1))
    source "$1"
    [ $? = 1 ] && \
        bl.module.log critical "Failed to source module \"$1\"." && \
        return 1
    bl_module_import_level=$((bl_module_import_level-1))
}
alias bl.module.import_with_namespace_check=bl_module_import_with_namespace_check
bl_module_import_with_namespace_check() {
    local __doc__='
    Sources a script and checks variable definitions before and after sourcing.
    '
    local file_path="$1"
    local resolved_scope_name="$2"
    local scope_name="$3"
    if (( bl_module_import_level == 0 )); then
        bl_module_declared_function_names_before_source_file_path="$(mktemp \
            --suffix=bashlink-module-declared-function-names-before-source)"
    fi
    local declared_names_after_source_file_path="$(mktemp \
        --suffix=bashlink-module-declared-names-after-source)"
    # NOTE: All variables which are declared after "determine_declared_names"
    # will be interpreted as newly introduced variables from given module.
    local alternate_resolved_scope_name="$(echo "$resolved_scope_name" | \
        sed --regexp-extended 's/\./_/g')"
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
        if [[ $name =~ ^${resolved_scope_name}[_A-Z]$ ]] || [[ $name =~ ^${alternate_resolved_scope_name//\./\\\\./}[.A-Z]$ ]]; then
            bl.module.log warn \
                "Namespace \"$resolved_scope_name\" in \"$scope_name\" is" \
                "not clean: Name \"$name\" is" \
                "already defined." \
                1>&2
        fi
    done < "$bl_module_declared_names_before_source_file_path"
    ## endregion
    bl.module.import_raw "$file_path"
    # Check if sourcing has introduced unprefixed names.
    bl.module.determine_declared_names >"$declared_names_after_source_file_path"
    # endregion
    local new_declared_names
    new_declared_names="$(echo "$(! diff \
        "$bl_module_declared_names_before_source_file_path" \
        "$declared_names_after_source_file_path" | \
        grep -e "^>" | sed 's/^> //'
    )" | sed 's/[0-9]*:> //g')"
    for name in $new_declared_names; do
        if ! [[ $name =~ ^${resolved_scope_name}[_A-Z]* ]] || ! [[ $name =~ ^${alternate_resolved_scope_name//\./\\\\./}[.A-Z]* ]]; then
            local excluded=false
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
            if ! $excluded; then
                bl.module.log \
                    warn \
                    "Module \"$scope_name\" introduces a global" \
                    "unprefixed name: \"$name\". Maybe it should be" \
                    "prefixed with \"${resolved_scope_name}.\" or" \
                    "\"$(echo "$resolved_scope_name" | \
                        sed --regexp-extended 's/\./_/g')_\"." \
                    1>&2
            fi
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
        bl_module_declared_function_names_after_source="$(echo "$(! diff \
            "$bl_module_declared_function_names_before_source_file_path" \
            "$bl_module_declared_function_names_after_source_file_path" | \
            grep '^>' | sed 's/^> //'
        )" | sed 's/[0-9]*:> //g')"
        rm "$bl_module_declared_function_names_after_source_file_path"
        rm "$bl_module_declared_function_names_before_source_file_path"
    elif (( bl_module_import_level == 1 )); then
        bl.module.determine_declared_names true \
            >"$bl_module_declared_function_names_before_source_file_path"
    fi
}
alias bl.module.resolve=bl_module_resolve
bl_module_resolve() {
    # shellcheck disable=SC2016,SC1004
    local __doc__='
    IMPORTANT: Do not use "bl.module.import" inside functions -> aliases do not work
    TODO: explain this in more detail
    >>> (
    >>> bl.module.import bashlink.logging
    >>> bl.logging.set_level warn
    >>> bl.module.import test/mockup_module-b.sh false
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
    local current_path="$(bl.path.convert_to_absolute "$(dirname "$(dirname "${BASH_SOURCE[0]}")")")"
    if (( $# == 1 )) || [ "${!#}" = true ] || [ "${!#}" = false ]; then
        caller_path="$(bl.path.convert_to_absolute "$(dirname "${BASH_SOURCE[1]}")")"
    else
        caller_path="$(bl.path.convert_to_absolute "$(dirname "${!#}")")"
    fi
    local execution_path="$(bl.path.convert_to_absolute "$(dirname "${BASH_SOURCE[-1]}")")"
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
            local new_name="$(echo "$name" | sed --regexp-extended \
                's:.([^.]+?)(\.(sh|bash|zsh|csh))?$:/\1\2:')"
            if [ "$name_name" = "$name" ]; then
                break
            else
                name="$new_name"
            fi
        else
            break
        fi
    done
    if [ "$file_path" == '' ]; then
        bl.module.log \
            critical \
            "Module file path for \"$name\" could not be resolved for" \
            "\"${BASH_SOURCE[1]}\" in \"$caller_path\", \"$execution_path\"" \
            "or \"$current_path\" for one of the file extension:" \
            "${extension_description}."
        return 1
    fi
    if [ "$2" = true ]; then
        echo "$(bl.path.convert_to_absolute "$file_path")/$(basename "$1")"
    else
        echo "$(bl.path.convert_to_absolute "$file_path")"
    fi
}
alias bl.module.is_loaded=bl_module_is_loaded
bl_module_is_loaded() {
    local file_path="$(bl.module.resolve "$1" "${BASH_SOURCE[1]}")"
    # Check if module already loaded.
    local loaded_module
    for loaded_module in "${bl_module_imported[@]}"; do
        if [[ "$loaded_module" == "$file_path" ]]; then
            return 0
        fi
    done
    return 1
}
alias bl.module.import_without_namespace_check=bl_module_import_without_namespace_check
bl_module_import_without_namespace_check() {
    if bl.module.is_loaded "$1"; then
        return 0
    fi
    local file_path="$(bl.module.resolve "$1" "${BASH_SOURCE[1]}")"
    bl_module_imported+=("$file_path")
    bl.module.import_raw "$file_path"
}
alias bl.module.import=bl_module_import
bl_module_import() {
    if bl.module.is_loaded "$1"; then
        return 0
    fi
    # NOTE: We have to use "local" before to avoid shadowing the "$?" value.
    local result
    result="$(bl.module.resolve "$1" true "${BASH_SOURCE[1]}")"
    local return_code=$?
    if (( return_code == 0 )); then
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
                    local name="$(echo "$sub_file_path" | \
                        sed --regexp-extended \
                            "s:${scope_name}/([^/]+):${scope_name}.\1:")"
                    bl.module.import "$name"
                fi
            done
        else
            bl_module_imported+=("$file_path")
            if $bl_module_prevent_namespace_check; then
                bl.module.import_raw "$file_path"
            else
                local rewrite
                scope_name="${scope_name%.sh}"
                local resolved_scope_name="$scope_name"
                for rewrite in "${bl_module_scope_rewrites[@]}"; do
                    resolved_scope_name="$(echo "$resolved_scope_name" | \
                        sed --regexp-extended "s/$rewrite")"
                done
                bl.module.import_with_namespace_check \
                    "$file_path" "$resolved_scope_name" "$scope_name"
            fi
        fi
    else
        echo "$result"
        return 1
    fi
}
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
