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
bashlink.module.import bashlink.array
# endregion
# region functions
# shellcheck disable=SC2034,SC2016
arguments__doc__='
    The arguments module provides an argument parser that can be used in
    functions and scripts.

    Different functions are provided in order to parse an arguments array.

    #### Example
    >>> _() {
    >>>     local value
    >>>     arguments.set "$@"
    >>>     arguments.get_parameter param1 value
    >>>     echo "param1: $value"
    >>>     arguments.get_keyword keyword2 value
    >>>     echo "keyword2: $value"
    >>>     arguments.get_flag --flag4 value
    >>>     echo "--flag4: $value"
    >>>     # NOTE: Get the positionals last
    >>>     arguments.get_positional 1 value
    >>>     echo 1: "$value"
    >>>     # Alternative way to get positionals: Set the arguments array to
    >>>     # to all unparsed arguments.
    >>>     arguments.apply_new_arguments
    >>>     echo 1: "$1"
    >>> }
    >>> _ param1 value1 keyword2=value2 positional3 --flag4
    param1: value1
    keyword2: value2
    --flag4: true
    1: positional3
    1: positional3

'
arguments_new_arguments=()
arguments_set() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    ```
    arguments.set argument1 argument2 ...
    ```

    Set the array the arguments-module is working on. After getting the desired
    arguments, the new argument array can be accessed via
    `arguments_new_arguments`. This new array contains all remaining arguments.

    '
    arguments_new_arguments=("$@")

}
alias arguments.set="arguments_set"
arguments_get_flag() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    ```
    arguments.get_flag flag [flag_aliases...] variable_name
    ```

    Sets `variable_name` to true if flag (or on of its aliases) is contained in
    the argument array (see `arguments.set`)

    #### Example
    ```
    arguments.get_flag verbose --verbose -v verbose_is_set
    ```

    #### Tests
    >>> arguments.set other_param1 --foo other_param2
    >>> local foo bar
    >>> arguments.get_flag --foo -f foo
    >>> echo $foo
    >>> arguments.get_flag --bar bar
    >>> echo $bar
    >>> echo "${arguments_new_arguments[@]}"
    true
    false
    other_param1 other_param2

    >>> arguments.set -f
    >>> local foo
    >>> arguments.get_flag --foo -f foo
    >>> echo $foo
    true

    '
    local variable match argument flag
    local flag_aliases=($(array.slice :-1 "$@"))
    variable="$(array.slice -1 "$@")"
    local new_arguments=()
    eval "${variable}=false"
    for argument in "${arguments_new_arguments[@]:-}"; do
        match=false
        for flag in "${flag_aliases[@]}"; do
            if [[ "$argument" == "$flag" ]]; then
                match=true
                eval "${variable}=true"
            fi
        done
        $match || new_arguments+=( "$argument" )
    done
    arguments_new_arguments=( "${new_arguments[@]:+${new_arguments[@]}}" )
}
alias arguments.get_flag="arguments_get_flag"
arguments_get_keyword() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    ```
    arguments.get_keyword keyword variable_name
    ```

    Sets `variable_name` to the "value" of `keyword` the argument array (see
    `arguments.set`) contains "keyword=value".

    #### Example
    ```
    arguments.get_keyword log loglevel
    ```
    #### Tests
    >>> local foo
    >>> arguments.set other_param1 foo=bar baz=baz other_param2
    >>> arguments.get_keyword foo foo
    >>> echo $foo
    >>> echo "${arguments_new_arguments[@]}"
    bar
    other_param1 baz=baz other_param2

    >>> local foo
    >>> arguments.set other_param1 foo=bar baz=baz other_param2
    >>> arguments.get_keyword foo
    >>> echo $foo
    >>> arguments.get_keyword baz foo
    >>> echo $foo
    bar
    baz
    '
    local keyword="$1"
    local variable="$1"
    [[ "${2:-}" != "" ]] && variable="$2"
    # NOTE: use unique variable name "value_csh94wwn25" here as this prevents
    # evaling something like "value=$value"
    local argument key value_csh94wwn25
    local new_arguments=()
    for argument in "${arguments_new_arguments[@]:-}"; do
        if [[ "$argument" == *=* ]]; then
            IFS="=" read -r key value_csh94wwn25 <<<"$argument"
            if [[ "$key" == "$keyword" ]]; then
                eval "${variable}=$value_csh94wwn25"
            else
                new_arguments+=( "$argument" )
            fi
        else
            new_arguments+=( "$argument" )
        fi
    done
    arguments_new_arguments=( "${new_arguments[@]:+${new_arguments[@]}}" )
}
alias arguments.get_keyword="arguments_get_keyword"
arguments_get_parameter() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    ```
    arguments.get_parameter parameter [parameter_aliases...] variable_name
    ```

    Sets `variable_name` to the field following `parameter` (or one of the
    `parameter_aliases`) from the argument array (see `arguments.set`).

    #### Example
    ```
    arguments.get_parameter --log-level -l loglevel
    ```

    #### Tests
    >>> local foo
    >>> arguments.set other_param1 --foo bar other_param2
    >>> arguments.get_parameter --foo -f foo
    >>> echo $foo
    >>> echo "${arguments_new_arguments[@]}"
    bar
    other_param1 other_param2
    '
    local parameter_aliases parameter variable argument index match
    parameter_aliases=($(array.slice :-1 "$@"))
    variable="$(array.slice -1 "$@")"
    match=false
    local new_arguments=()
    for index in "${!arguments_new_arguments[@]}"; do
        argument="${arguments_new_arguments[$index]}"
        $match && match=false && continue
        match=false
        for parameter in "${parameter_aliases[@]}"; do
            if [[ "$argument" == "$parameter" ]]; then
                eval "${variable}=${arguments_new_arguments[((index+1))]}"
                match=true
                break
            fi
        done
        $match || new_arguments+=( "$argument" )
    done
    arguments_new_arguments=( "${new_arguments[@]:+${new_arguments[@]}}" )
}
alias arguments.get_parameter="arguments_get_parameter"
arguments_get_positional() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    ```
    arguments.get_positional index variable_name
    ```

    Get the positional parameter at `index`. Use after extracting parameters,
    keywords and flags.

    >>> arguments.set parameter foo --flag pos1 pos2 --keyword=foo
    >>> arguments.get_flag --flag _
    >>> arguments.get_parameter parameter _
    >>> arguments.get_keyword --keyword _
    >>> local positional1 positional2
    >>> arguments.get_positional 1 positional1
    >>> arguments.get_positional 2 positional2
    >>> echo "$positional1 $positional2"
    pos1 pos2
    '
    local index="$1"
    (( index-- )) # $0 is not available here
    local variable="$2"
    eval "${variable}=${arguments_new_arguments[index]}"
}
alias arguments.get_positional="arguments_get_positional"
arguments_apply_new_arguments() {
    local __doc__='
    Call this function after you are finished with argument parsing. The
    arguments array ($@) will then contain all unparsed arguments that are
    left.
    '
    # implemented as alias
    true
}
alias arguments.apply_new_arguments='set -- "${arguments_new_arguments[@]}"'
# TODO
arguments_wrapper_with_minimum_number_of_arguments() {
    local __doc__='
    Supports default arguments with a minimum number of arguments for functions
    by wrapping them.

        PROGRAM_NAME $(arguments.wrapper_with_minimum_number_of_arguments \
            NUMBER_OF_DEFAULT_ARGUMENTS \
            MINIMUM_NUMBER_OF_ARGUMENTS_TO_OVERWRITE_DEFAULT_ARGUMENTS \
            DEFAULT_ARGUMENTS* \
            $@
        )

    >>> # Runs "subProgram" with arguments "all", "--log-level" and "warning"
    >>> # if not at least two arguments are given to "program":
    >>> program() {
    >>>     echo subProgram \
    >>>         $(defaultArgumentsWrapperWithMinimumNumberOfArguments 3 2 \
    >>>         all --log-level warning $@)
    >>> }
    '
    if [ $# -le $(($1+$2+1)) ]; then
        # Return default arguments.
        echo ${@:3:$1}
        return $?
    else
        # Return given arguments.
        echo ${@:3+$1}
        return $?
    fi
}
alias arguments.wrapper_with_minimum_number_of_arguments='arguments_wrapper_with_minimum_number_of_arguments'
arguments_default_wrapper() {
    local __doc__='
    Wrapper function for
    "arguments.wrapper_with_minimum_number_of_arguments" with second parameter
    is setted to "1".

        PROGRAM_NAME $(arguments.default_wrapper \
            NUMBER_OF_DEFAULT_ARGUMENTS \
            DEFAULT_ARGUMENTS* \
            $@
        )

    >>> # Runs "subProgram" with arguments "all", "--log-level" and "warning"
    >>> # if not at least one arguments are given to "program".
    >>> program() {
    >>>     echo subProgram $(defaultArgumentsWrapper 3 all --log-level \
    >>>         warning $@)
    >>> }
    '
    echo $(defaultArgumentsWrapperWithMinimumNumberOfArguments $1 1 ${@:2})
    return $?
}
alias arguments.default_wrapper='arguments_default_wrapper'
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
