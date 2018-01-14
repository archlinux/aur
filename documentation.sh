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
        # shellcheck disable 16
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
    module=$1
    (
    bl.module.import "$module" || bl.logging.warn "Failed to import module $module"
    declared_function_names="$bl_module_declared_function_names_after_source"
    module="$(basename "$module")"
    module="${module%.sh}"
    declared_module_functions="$(! declare -F | cut -d' ' -f3 | grep -e "^${module%.sh}" )"
    declared_function_names="$declared_function_names"$'\n'"$declared_module_functions"
    declared_function_names="$(bl.tools.unique <(echo "$declared_function_names"))"

    # module level doc
    local scope_name="$(bl.module.rewrite_scope_name "$(echo "$(bl.module.resolve "$module" true)" | sed --regexp-extended 's:^.*/([^/]+)$:\1:')" | sed --regexp-extended 's:\.:_:g')"
    test_identifier="${scope_name}__doc__"
    local docstring="${!test_identifier}"
    bl.logging.plain "## Module $module"
    if [[ -z "$docstring" ]]; then
        bl.logging.warn "No top level documentation for module $module" 1>&2
    else
        bl.logging.plain "$(bl.documentation.format_docstring "$docstring")"
    fi

    # function level documentation
    test_identifier=__doc__
    local function
    for function in $declared_function_names; do
        # shellcheck disable=SC2089
        docstring="$(bl.doctest.get_function_docstring "$function")"
        if [[ -z "$docstring" ]]; then
            bl.logging.warn "No documentation for function $function" 1>&2
        else
            bl.logging.plain "### Function $function"
            bl.logging.plain "$(bl.documentation.format_docstring "$docstring")"
        fi
    done
    )
}
alias bl.documentation.serve=bl_documentation_serve
bl_documentation_serve() {
    # shellcheck disable=SC2016,SC2034
    local __doc__='
    Serves a readme via webserver. Uses Flatdoc.
    '
    local readme="$1"
    [[ "$readme" == "" ]] && readme="README.md"
    local server_root="$(mktemp --directory)"
    cp "$readme" "$server_root/README.md"
    pushd "$server_root"
    wget --output-document index.html \
        https://cdn.rawgit.com/jandob/rebash/gh-pages/index-local.html
    python -m http.server
    popd
    rm -rf "$server_root"
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
