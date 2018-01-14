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
bl.module.import bashlink.arguments
bl.module.import bashlink.doctest
bl.module.import bashlink.logging
bl.module.import bashlink.path
bl.module.import bashlink.tools
# endregion
# region functions
alias bl.documentation.format_buffers=bl_documentation_format_buffers
bl_documentation_format_buffers() {
    local buffer="$1"
    local output_buffer="$2"
    local text_buffer="$3"
    [[ "$text_buffer" != "" ]] && echo "$text_buffer"
    if [[ "$buffer" != "" ]]; then
        # shellcheck disable=SC2016
        echo '```bash'
        echo "$buffer"
        echo "$output_buffer"
        echo '```'
    fi
}
alias bl.documentation.format_docstring=bl_documentation_format_docstring
bl_documentation_format_docstring() {
    local docstring="$1"
    docstring="$(echo "$docstring" \
        | sed '/+bl.documentation.exclude_print/d' \
        | sed '/-bl.documentation.exclude_print/d' \
        | sed '/+bl.documentation.exclude/,/-bl.documentation.exclude/d')"
    bl.doctest.parse_docstring "$docstring" bl_documentation_format_buffers \
        --preserve-prompt
}
alias bl.documentation.generate=bl_documentation_generate
bl_documentation_generate() {
    # TODO add doc test setup function to documentation
    module_reference="$1"
    local result="$(bl.module.resolve "$module_reference" true)"
    local file_path="$(echo "$result" | sed --regexp-extended 's:^(.+)/[^/]+$:\1:')"
    local module_name="$(echo "$result" | sed --regexp-extended 's:^.*/([^/]+)$:\1:')"
    local scope_name="$(bl.module.rewrite_scope_name "$module_name" | sed --regexp-extended 's:\.:_:g')"
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
                local name="$(bl.module.remove_known_file_extension \
                    "$(echo "$sub_file_path" | sed --regexp-extended \
                        "s:${scope_name}/([^/]+):${scope_name}.\1:")")"
                bl.documentation.generate "$name"
            fi
        done
        return 0
    fi
    (
        bl.module.import "$module_reference" || \
            bl.logging.warn \
            "Failed to generate documentation for \"$module_name\" due to an import error during resolving \"$module_reference\"." \
            1>&2
        # NOTE: Get all external module prefix and unprefixed function names.
        local declared_function_names="$module_declared_function_names_after_source"
        # NOTE: Adds internal already loaded but correctly prefixed functions.
        declared_function_names+=" $(! declare -F | cut -d' ' -f3 | grep -e "^$scope_name" )"
        # NOTE: Removes duplicates.
        declared_functions="$(bl.tools.unique <(echo "$declared_functions"))"
        # module level doc
        local module_documentation_variable_name="${scope_name}__documentation__"
        local docstring="${!module_documentation_variable_name}"
        bl.logging.plain "## Module $module_name"
        if [[ -z "$docstring" ]]; then
            bl.logging.warn \
                "No top level documentation for module \"$module_name\" referenced by \"$module_reference\"." \
                1>&2
        else
            bl.logging.plain "$(bl.documentation.format_docstring "$docstring")"
        fi
        # function level documentation
        test_identifier=__documentation__
        local name
        for name in $declared_function_names; do
            # shellcheck disable=SC2089
            docstring="$(bl.doctest.get_function_docstring "$name")"
            if [[ -z "$docstring" ]]; then
                bl.logging.warn "No documentation for function \"$name\"." 1>&2
            else
                bl.logging.plain "### Function $name"
                bl.logging.plain "$(bl.documentation.format_docstring "$docstring")"
            fi
        done
    )
}
alias bl.documentation.parse_arguments=bl_documentation_parse_arguments
bl_documentation_parse_arguments() {
    local filename module main_documentation serve
    bl.arguments.set "$@"
    bl.arguments.get_flag --serve serve
    bl.arguments.apply_new
    $serve && bl.documentation.serve "$1" && return 0
    main_documentation="$(dirname "${BASH_SOURCE[0]}")/rebash.md"
    if [ $# -eq 0 ]; then
        [[ -e "$main_documentation" ]] && cat "$main_documentation"
        bl.logging.plain ""
        bl.logging.plain "# Generated documentation"
        for filename in $(dirname "$0")/*.sh; do
            module=$(basename "${filename%.sh}")
            bl.documentation.generate "$module"
        done
    else
        bl.logging.plain "# Generated documentation"
        for module in "$@"; do
            bl.documentation.generate "$module"
        done
    fi
    return 0
}
alias bl.documentation.print_docstring=bl_documentation_print_docstring
bl_documentation_print_docstring() {
    local docstring="$1"
    echo "$docstring" \
        | sed '/+bl.documentation.exclude_print/,/-bl.documentation.exclude_print/d' \
        | sed '/+bl.documentation.exclude/,/-bl.documentation.exclude/d' \
        | sed '/```/d'
}
# endregion
if bl.tools.is_main; then
    bl.logging.set_level debug
    bl.logging.set_commands_level info
    bl.documentation.parse_arguments "$@"
fi
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
