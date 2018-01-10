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
bl.module.import bashlink.cli
bl.module.import bashlink.documentation
bl.module.import bashlink.exception
bl.module.import bashlink.logging
bl.module.import bashlink.path
bl.module.import bashlink.time
bl.module.import bashlink.tools
# endregion
# region variables
# shellcheck disable=SC2034,SC2016
bl_doctest__doc__='
    The doctest module implements function and module level testing via "doc
    strings".
    Tests can be run by invoking `doctest.sh file1 folder1 file2 ...`.
    #### Options:
    ```
    --help|-h                   Print help message.
    --side-by-side              Print diff of failing tests side by side.
    --no-check-namespace        Do not warn about unprefixed definitions.
    --no-check-undocumented     Do not warn about undocumented functions.
    --use-nounset               Accessing undefined variables produces error.
    --verbose|-v                Be more verbose
    ```
    #### Example output `./doctest.sh -v arguments.sh`
    ```bash
    [verbose:doctest.sh:330] bl.arguments:[PASS]
    [verbose:doctest.sh:330] bl.arguments.get_flag:[PASS]
    [verbose:doctest.sh:330] bl.arguments.get_keyword:[PASS]
    [verbose:doctest.sh:330] bl.arguments.get_parameter:[PASS]
    [verbose:doctest.sh:330] bl.arguments.get_positional:[PASS]
    [verbose:doctest.sh:330] bl.arguments.set:[PASS]
    [info:doctest.sh:590] bl.arguments - passed 6/6 tests in 918 ms
    [info:doctest.sh:643] Total: passed 1/1 modules in 941 ms
    ```
    A doc string can be defined for a function by defining a variable named
    `__doc__` at the function scope.
    On the module level, the variable name should be `<module_name>__doc__`
    (e.g. `bl_arguments__doc__` for the example above).
    Note: The doc string needs to be defined with single quotes.
    Code contained in a module level variable named
    `<module_name>__bl_doctest_setup__` will be run once before all the Tests of
    a module are run. This is usefull for defining mockup functions/data
    that can be used throughout all tests.
    +bl.documentation.exclude_print
    #### Tests
    Tests are delimited by blank lines:
    >>> echo bar
    bar
    >>> echo $(( 1 + 2 ))
    3
    But can also occur right after another:
    >>> echo foo
    foo
    >>> echo bar
    bar
    Single quotes can be escaped like so:
    >>> echo '"'"'$foos'"'"'
    $foos
    Or so
    >>> echo '\''$foos'\''
    $foos
    Some text in between.
    Multiline output
    >>> local i
    >>> for i in 1 2; do
    >>>     echo $i;
    >>> done
    1
    2
    Ellipsis support
    >>> local i
    >>> for i in 1 2 3 4 5; do
    >>>     echo $i;
    >>> done
    +bl.doctest.ellipsis
    1
    2
    ...
    Ellipsis are non greedy
    >>> local i
    >>> for i in 1 2 3 4 5; do
    >>>     echo $i;
    >>> done
    +bl.doctest.ellipsis
    1
    ...
    4
    5
    Each testcase has its own scope:
    >>> local testing="foo"; echo $testing
    foo
    >>> [ -z "${testing:-}" ] && echo empty
    empty
    Syntax error in testcode:
    >>> f() {a}
    +bl.doctest.contains
    +bl.doctest.ellipsis
    syntax error near unexpected token `{a}
    ...
    -bl.documentation.exclude_print
'
# endregion
# region functions
bl_doctest_compare_result() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    >>> local buffer="line 1
    >>> line 2"
    >>> local got="line 1
    >>> line 2"
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    0
    >>> local buffer="line 1
    >>> foo"
    >>> local got="line 1
    >>> line 2"
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    1
    >>> local buffer="+bl.doctest.contains
    >>> line
    >>> line"
    >>> local got="line 1
    >>> line 2"
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    0
    >>> local buffer="+bl.doctest.contains
    >>> line
    >>> foo"
    >>> local got="line 1
    >>> line 2"
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    1
    >>> local buffer="+bl.doctest.ellipsis
    >>> line
    >>> ...
    >>> "
    >>> local got="line
    >>> line 2
    >>> "
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    0
    >>> local buffer="+bl.doctest.ellipsis
    >>> line
    >>> ...
    >>> line 2
    >>> "
    >>> local got="line
    >>> ignore
    >>> ignore
    >>> line 2
    >>> "
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    0
    >>> local buffer="+bl.doctest.ellipsis
    >>> line
    >>> ...
    >>> line 2
    >>> "
    >>> local got="line
    >>> ignore
    >>> ignore
    >>> line 2
    >>> line 3
    >>> "
    >>> bl.doctest.compare_result "$buffer" "$got"; echo $?
    1
    '
    local buffer="$1"
    local got="$2"
    local buffer_line
    local got_line
    compare_lines() {
        if $contains; then
            [[ "$got_line" == *"$buffer_line"* ]] || return 1
        else
            [[ "$buffer_line" == "$got_line" ]] || return 1
        fi
    }
    local result=0
    local contains=false
    local ellipsis=false
    local ellipsis_on=false
    local ellipsis_waiting=false
    local end_of_buffer=false
    local end_of_got=false
    while true; do
        # parse buffer line
        if ! $ellipsis_waiting && ! $end_of_buffer && ! read -r -u3 buffer_line; then
            end_of_buffer=true
        fi
        if [[ "$buffer_line" == "+bl.doctest.no_capture_stderr"* ]]; then
            continue
        fi
        if [[ "$buffer_line" == "+bl.doctest.contains"* ]]; then
            contains=true
            continue
        fi
        if [[ "$buffer_line" == "+bl.doctest.ellipsis"* ]]; then
            ellipsis=true
            continue
        fi
        # parse got line
        if $end_of_got || ! read -r -u4 got_line; then
            end_of_got=true
        fi

        # set result
        if $ellipsis;then
            if [[ "$buffer_line" == "..." ]]; then
                ellipsis_on=true
            else
                [[ "$buffer_line" != "" ]] && $ellipsis_on && ellipsis_waiting=true
            fi
        fi
        $end_of_buffer && $end_of_got && break
        $end_of_buffer && $ellipsis_waiting && result=1 && break
        $end_of_got && $ellipsis_waiting && result=1 && break
        $end_of_buffer && $ellipsis_on && break
        if $ellipsis_on; then
            if compare_lines; then
                ellipsis_on=false
                ellipsis_waiting=false
            else
                $end_of_got && result=1
            fi
        else
            compare_lines || result=1
        fi
    done 3<<< "$buffer" 4<<< "$got"
    return $result
}
# shellcheck disable=SC2154
bl_doctest_eval() {
    local __doc__='
    >>> local test_buffer="
    >>> echo foo
    >>> echo bar
    >>> "
    >>> local output_buffer="foo
    >>> bar"
    >>> bl_doctest_use_side_by_side_output=false
    >>> bl_doctest_module_under_test=module
    >>> bl_doctest_nounset=false
    >>> bl_doctest_eval "$test_buffer" "$output_buffer"
    '
    local test_buffer="$1"
    [[ -z "$test_buffer" ]] && return 0
    local output_buffer="$2"
    local text_buffer="${3-}"
    local module="${4-}"
    local function="${5-}"
    local result=0
    local got declarations_before declarations_after
    eval_with_check() {
        local test_buffer="$1"
        local module="$2"
        local function="$3"
        local module_module_file_path="$(bl.path.convert_to_absolute "$(dirname "${BASH_SOURCE[0]}")")/module.sh"
        local setup_identifier="${module//[^[:alnum:]_]/_}"__bl_doctest_setup__
        local setup_string="${!setup_identifier:-}"
        test_script="$(
            echo '[ -z "$BASH_REMATCH" ] && BASH_REMATCH=""'
            echo "source $module_module_file_path"
            # Suppress the warnings here because they have already been printed
            # when analyzing the module initially.
            echo "bl_module_prevent_namespace_check=true"
            echo "bl.module.import $doctest_module_under_test"
            echo "bl_module_prevent_namespace_check=false"
            echo "$setup_string"
            # _ can be used as anonymous variable (without warning)
            echo "_=''"
            echo "bl.module.determine_declared_names > $declarations_before"
            $doctest_nounset && echo 'set -o nounset'
            # NOTE: We havt to wrap the test context a function to ensure the
            # "local" keyword has an effect inside.
            echo "
                _() {
                    $test_buffer
                }
                _
            "
            echo "bl.module.determine_declared_names > $declarations_after"
        )"
        # run in clean environment
        if echo "$output_buffer" | grep '+bl.doctest.no_capture_stderr' &>/dev/null; then
            bash --noprofile --norc <(echo "$test_script")
        else
            bash --noprofile --norc 2>&1 <(echo "$test_script")
        fi
        local result=$?
        return $result
    }
    declarations_before="$(mktemp --suffix=bashlink-doctest)"
    trap "rm --force $declarations_before; exit" EXIT
    declarations_after="$(mktemp --suffix=bashlink-doctest)"
    trap "rm --force $declarations_after; exit" EXIT
    # TODO $module $function as parameters
    got="$(eval_with_check "$test_buffer" "$module" "$function")"
    bl_doctest_new_declared_names="$(diff "$declarations_before" "$declarations_after" \
        | grep -e "^>" | sed 's/^> //')"
    # TODO $module $function as parameters
    bl.doctest.print_declaration_warning "$module" "$function"
    rm "$declarations_before"
    rm "$declarations_after"
    if ! bl.doctest.compare_result "$output_buffer" "$got"; then
        echo -e "${bl_cli_color_lightred}test:${bl_cli_color_default}"
        echo "$test_buffer"
        if $bl_doctest_use_side_by_side_output; then
            output_buffer="expected"$'\n'"${output_buffer}"
            got="got"$'\n'"${got}"
            # TODO exclude doctest_options
            local diff=diff
            bl.tools.dependency_check colordiff && diff=colordiff
            $diff --side-by-side <(echo "$output_buffer") <(echo "$got")
        else
            echo -e "${bl_cli_color_lightred}expected:${bl_cli_color_default}"
            echo "$output_buffer"
            echo -e "${bl_cli_color_lightred}got:${bl_cli_color_default}"
            echo "$got"
        fi
        return 1
    fi
}
bl_doctest_run_test() {
    local doc_string="$1"
    local module="$2"
    local function="$3"
    local test_name="$module"
    [[ -z "$function" ]] || test_name="$function"
    if bl.doctest.parse_doc_string "$doc_string" bl_doctest_eval ">>>" \
        "$module" "$function"
    then
        bl.logging.verbose "$test_name:[${bl_cli_color_lightgreen}PASS${bl_cli_color_default}]"
    else
        bl.logging.warn "$test_name:[${bl_cli_color_lightred}FAIL${bl_cli_color_default}]"
        return 1
    fi
}
bl_doctest_parse_doc_string() {
    local __doc__='
    >>> local doc_string="
    >>>     (test)block
    >>>     output block
    >>> "
    >>> _() {
    >>>     local output_buffer="$2"
    >>>     echo block:
    >>>     while read -r line; do
    >>>         if [ -z "$line" ]; then
    >>>             echo "empty_line"
    >>>         else
    >>>             echo "$line"
    >>>         fi
    >>>     done <<< "$output_buffer"
    >>> }
    >>> bl.doctest.parse_doc_string "$doc_string" _ "(test)"
    block:
    output block
    >>> local doc_string="
    >>>     Some text (block 1).
    >>>
    >>>
    >>>     Some more text (block 1).
    >>>     (test)block 2
    >>>     (test)block 2.2
    >>>     output block 2
    >>>     (test)block 3
    >>>     output block 3
    >>>
    >>>     Even more text (block 4).
    >>> "
    >>> local i=0
    >>> _() {
    >>>     local test_buffer="$1"
    >>>     local output_buffer="$2"
    >>>     local text_buffer="$3"
    >>>     local line
    >>>     (( i++ ))
    >>>     echo "text_buffer (block $i):"
    >>>     if [ ! -z "$text_buffer" ]; then
    >>>         while read -r line; do
    >>>             if [ -z "$line" ]; then
    >>>                 echo "empty_line"
    >>>             else
    >>>                 echo "$line"
    >>>             fi
    >>>         done <<< "$text_buffer"
    >>>     fi
    >>>     echo "test_buffer (block $i):"
    >>>     [ ! -z "$test_buffer" ] && echo "$test_buffer"
    >>>     echo "output_buffer (block $i):"
    >>>     [ ! -z "$output_buffer" ] && echo "$output_buffer"
    >>>     return 0
    >>> }
    >>> bl.doctest.parse_doc_string "$doc_string" _ "(test)"
    text_buffer (block 1):
    Some text (block 1).
    empty_line
    empty_line
    Some more text (block 1).
    test_buffer (block 1):
    output_buffer (block 1):
    text_buffer (block 2):
    test_buffer (block 2):
    block 2
    block 2.2
    output_buffer (block 2):
    output block 2
    text_buffer (block 3):
    test_buffer (block 3):
    block 3
    output_buffer (block 3):
    output block 3
    text_buffer (block 4):
    Even more text (block 4).
    test_buffer (block 4):
    output_buffer (block 4):
    '
    local preserve_prompt
    bl.arguments.set "$@"
    bl.arguments.get_flag --preserve-prompt preserve_prompt
    bl.arguments.apply_new_arguments
    local doc_string="$1"  # the docstring to test
    local parse_buffers_function="$2"
    local prompt="$3"
    local module="${4:-}"
    local function="${5:-}"
    [ -z "$prompt" ] && prompt=">>>"
    local text_buffer=""
    local test_buffer=""
    local output_buffer=""

    # remove leading blank line
    [[ "$(head --lines=1 <<< "$doc_string")" != *[![:space:]]* ]] &&
        doc_string="$(tail --lines=+2 <<< "$doc_string" )"
    # remove trailing blank line
    [[ "$(tail --lines=1 <<< "$doc_string")" != *[![:space:]]* ]] &&
        doc_string="$(head --lines=-1 <<< "$doc_string" )"

    eval_buffers() {
        $parse_buffers_function "$test_buffer" "$output_buffer" \
            "$text_buffer" "$module" "$function"
        local result=$?
        # clear buffers
        text_buffer=""
        test_buffer=""
        output_buffer=""
        return $result
    }
    local line
    local state=TEXT
    local next_state
    local temp_prompt
    #local indentation=""
    while read -r line; do
        #line="$(echo "$line" | sed -e 's/^[[:blank:]]*//')" # lstrip
        case "$state" in
            TEXT)
                if [[ "$line" = "" ]]; then
                    next_state=TEXT
                    [ ! -z "$text_buffer" ] && text_buffer+=$'\n'"$line"
                elif [[ "$line" = "$prompt"* ]]; then
                    next_state=TEST
                    [ ! -z "$text_buffer" ] && eval_buffers
                    $preserve_prompt && temp_prompt="$prompt" && prompt=""
                    test_buffer="${line#$prompt}"
                    $preserve_prompt && prompt="$temp_prompt"
                else
                    next_state=TEXT
                    # check if start of text
                    if [ -z "$text_buffer" ]; then
                        text_buffer="$line"
                    else
                        text_buffer+=$'\n'"$line"
                    fi
                fi
                ;;
            TEST)
                #[ -z "$indentation" ] &&
                    #indentation="$(echo "$line"| grep -o "^[[:blank:]]*")"
                if [[ "$line" = "" ]]; then
                    next_state=TEXT
                    eval_buffers
                    [ $? == 1 ] && return 1
                elif [[ "$line" = "$prompt"* ]]; then
                    next_state=TEST
                    # check if start of test
                    $preserve_prompt && temp_prompt="$prompt" && prompt=""
                    if [ -z "$test_buffer" ]; then
                        test_buffer="${line#$prompt}"
                    else
                        test_buffer+=$'\n'"${line#$prompt}"
                    fi
                    $preserve_prompt && prompt="$temp_prompt"
                else
                    next_state=OUTPUT
                    output_buffer="$line"
                fi
                ;;
            OUTPUT)
                if [[ "$line" = "" ]]; then
                    next_state=TEXT
                    eval_buffers
                    [ $? == 1 ] && return 1
                elif [[ "$line" = "$prompt"* ]]; then
                    next_state=TEST
                    eval_buffers
                    [ $? == 1 ] && return 1
                    $preserve_prompt && temp_prompt="$prompt" && prompt=""
                    if [ -z "$test_buffer" ]; then
                        test_buffer="${line#$prompt}"
                    else
                        test_buffer+=$'\n'"${line#$prompt}"
                    fi
                    $preserve_prompt && prompt="$temp_prompt"
                else
                    next_state=OUTPUT
                    # check if start of output
                    if [ -z "$output_buffer" ]; then
                        output_buffer="$line"
                    else
                        output_buffer+=$'\n'"$line"
                    fi
                fi
                ;;
        esac
        state=$next_state
    done <<< "$doc_string"
    # shellcheck disable=SC2154
    [[ "$(tail --lines=1 <<< "$text_buffer")" = "" ]] &&
        text_buffer="$(head --lines=-1 <<< "$text_buffer" )"
    eval_buffers
}
bl_doctest_doc_identifier=__doc__
bl_doctest_doc_regex="/__doc__='/,/';$/p"
bl_doctest_doc_regex_one_line="__doc__='.*';$"
bl_doctest_get_function_docstring() {
    function="$1"
    (
        unset $bl_doctest_doc_identifier
        if ! doc_string="$(type "$function" | \
            grep "$bl_doctest_doc_regex_one_line")"
        then
            doc_string="$(type "$function" | sed --quiet "$bl_doctest_doc_regex")"
        fi
        eval "$doc_string"
        echo "${!bl_doctest_doc_identifier}"
    )
}
bl_doctest_print_declaration_warning() {
    local module="$1"
    local function="$2"
    local test_name="$module"
    [[ -z "$function" ]] || test_name="$function"
    [[ "$bl_doctest_new_declared_names" == "" ]] && return
    bl.tools.unique <<< "$bl_doctest_new_declared_names" \
        | while read -r variable_or_function
    do
        if ! [[ "$variable_or_function" =~ ^${module}[._]* ]]; then
            bl.logging.warn "Test '$test_name' defines unprefixed" \
                "name: '$variable_or_function'"
        fi
    done
}
bl_doctest_exception_active=false
bl_doctest_test_module() {
    (
    module=$1
    bl.module.import "$module" "$bl_doctest_supress_declaration"
    bl_doctest_module_under_test="$(bl.path.convert_to_absolute "$module")"
    declared_functions="$module_declared_function_names_after_source"
    module="$(basename "$module")"
    module="${module%.sh}"
    declared_module_functions="$(! declare -F | cut -d' ' -f3 | grep -e "^${module%.sh}" )"
    declared_functions="$declared_functions"$'\n'"$declared_module_functions"
    declared_functions="$(bl.tools.unique <(echo "$declared_functions"))"

    local total=0
    local success=0
    bl.time.start
    # module level tests
    test_identifier="${module//[^[:alnum:]_]/_}"__doc__
    doc_string="${!test_identifier}"
    if ! [ -z "$doc_string" ]; then
        let "total++"
        bl.doctest.run_test "$doc_string" "$module" && let "success++"
    fi
    # function level tests
    # TODO detect and warn doc_strings with double quotes
    test_identifier=__doc__
    for fun in $declared_functions; do
        # shellcheck disable=SC2089
        doc_string="$(bl.doctest.get_function_docstring "$fun")"
        if [[ "$doc_string" != "" ]]; then
            let "total++"
            bl.doctest.run_test "$doc_string" "$module" "$fun" && let "success++"
        else
            ! $bl_doctest_supress_undocumented && \
                bl.logging.warn "undocumented function $fun"
        fi
    done
    bl.logging.info "$module - passed $success/$total tests in" \
        "$(bl.time.get_elapsed) ms"
    (( success != total )) && exit 1
    exit 0
    )
}
bl_doctest_parse_args() {
    local __doc__='
        +bl.documentation.exclude
        >>> bl.doctest.parse_args non_existing_module
        >>> echo $?
        +bl.doctest.contains
        +bl.doctest.ellipsis
        Failed to test file: non_existing_module
        ...
        1
        -bl.documentation.exclude
    '
    local filename module directory verbose help
    bl.arguments.set "$@"
    bl.arguments.get_flag --help -h help
    $help && bl.documentation.print_doc_string "$bl_doctest__doc__" && return 0
    bl.arguments.get_flag --side-by-side bl_doctest_use_side_by_side_output
    # do not warn about unprefixed names
    bl.arguments.get_flag --no-check-namespace bl_doctest_supress_declaration
    # do not warn about undocumented functions
    bl.arguments.get_flag --no-check-undocumented bl_doctest_supress_undocumented
    # use set -o nounset inside tests
    bl.arguments.get_flag --use-nounset bl_doctest_nounset
    bl.arguments.get_flag --verbose -v verbose
    bl.arguments.apply_new_arguments

    if $verbose; then
        bl.logging.set_level verbose
    else
        bl.logging.set_level info
    fi
    test_directory() {
        directory="$(bl.path.convert_to_absolute "$1")"
        for filename in "$directory"/*.sh; do
            let "total++"
            bl.doctest.test_module "$(bl.path.convert_to_absolute "$filename")" &
        done
    }
    bl.time.start
    local total=0
    local success=0
    if [ $# -eq 0 ] || [ "$@" == "" ];then
        bl.doctest.test_directory "$(dirname "$0")"
    else
        for filename in "$@"; do
            if [ -f "$filename" ]; then
                let "total++"
                bl.doctest.test_module "$(bl.path.convert_to_absolute "$filename")" &
            elif [ -d "$filename" ]; then
                bl.doctest.test_directory "$filename"
            else
                let "total++"
                bl.logging.warn "Failed to test file: $filename"
            fi
        done
    fi
    local job
    for job in $(jobs -p); do
        wait "$job" && let "success++"
    done
    bl.logging.info "Total: passed $success/$total modules in" \
        "$(bl.time.get_elapsed) ms"
    (( success != total )) && return 1
    return 0
}
# endregion
if bl.tools.is_main; then
    bl.doctest.parse_args "$@"
fi
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
