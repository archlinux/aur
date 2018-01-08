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
bashlink.module.import bashlink.arguments
bashlink.module.import bashlink.doctest
bashlink.module.import bashlink.logging
# endregion
documentation_format_buffers() {
    local buffer="$1"
    local output_buffer="$2"
    local text_buffer="$3"
    [[ "$text_buffer" != "" ]] && echo "$text_buffer"
    if [[ "$buffer" != "" ]]; then
        # shellcheck disable=SC2016
        echo '```bash'
        echo "$buffer"
        echo "$output_buffer"
        # shellcheck disable=SC2016
        echo '```'
    fi
}
documentation_format_docstring() {
    local doc_string="$1"
    doc_string="$(echo "$doc_string" \
        | sed '/+documentation_exclude_print/d' \
        | sed '/-documentation_exclude_print/d' \
        | sed '/+documentation_exclude/,/-documentation_exclude/d')"
    doctest.parse_doc_string "$doc_string" documentation_format_buffers \
        --preserve-prompt
}
documentation_generate() {
    # TODO add doc test setup function to documentation
    module=$1
    (
    core.import "$module" || logging.warn "Failed to import module $module"
    declared_functions="$core_declared_functions_after_import"
    module="$(basename "$module")"
    module="${module%.sh}"
    declared_module_functions="$(! declare -F | cut -d' ' -f3 | grep -e "^${module%.sh}" )"
    declared_functions="$declared_functions"$'\n'"$declared_module_functions"
    declared_functions="$(core.unique <(echo "$declared_functions"))"

    # module level doc
    test_identifier="$module"__doc__
    local doc_string="${!test_identifier}"
    logging.plain "## Module $module"
    if [[ -z "$doc_string" ]]; then
        logging.warn "No top level documentation for module $module" 1>&2
    else
        logging.plain "$(documentation_format_docstring "$doc_string")"
    fi

    # function level documentation
    test_identifier=__doc__
    local function
    for function in $declared_functions;
    do
        # shellcheck disable=SC2089
        doc_string="$(doctest.get_function_docstring "$function")"
        if [[ -z "$doc_string" ]]; then
            logging.warn "No documentation for function $function" 1>&2
        else
            logging.plain "### Function $function"
            logging.plain "$(documentation_format_docstring "$doc_string")"
        fi
    done
    )
}
documentation_serve() {
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
    python2 -m SimpleHTTPServer 8080
    popd
    rm -rf "$server_root"
}
documentation_parse_args() {
    local filename module main_documentation serve
    arguments.set "$@"
    arguments.get_flag --serve serve
    arguments.apply_new_arguments
    $serve && documentation_serve "$1" && return 0
    main_documentation="$(dirname "${BASH_SOURCE[0]}")/rebash.md"
    if [ $# -eq 0 ]; then
        [[ -e "$main_documentation" ]] && cat "$main_documentation"
        logging.plain ""
        logging.plain "# Generated documentation"
        for filename in $(dirname "$0")/*.sh; do
            module=$(basename "${filename%.sh}")
            documentation_generate "$module"
        done
    else
        logging.plain "# Generated documentation"
        for module in "$@"; do
            documentation_generate "$(core_abs_path "$module")"
        done
    fi
    return 0
}
documentation_print_doc_string() {
    local doc_string="$1"
    echo "$doc_string" \
        | sed '/+documentation_exclude_print/,/-documentation_exclude_print/d' \
        | sed '/+documentation_exclude/,/-documentation_exclude/d' \
        | sed '/```/d'
}
alias documentation.print_doc_string="documentation_print_doc_string"

if [[ ${BASH_SOURCE[0]} == "$0" ]]; then
    logging.set_level debug
    logging.set_commands_level info
    documentation_parse_args "$@"
fi
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
