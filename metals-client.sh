#!/bin/bash

set -e

declare -r _INSTALL_DIR='/usr/share/java/metals'
declare _CP="$_INSTALL_DIR/lib:$_INSTALL_DIR/metals"
declare -r -A _JAVA_8_ARCH_RUNTIME_TO_PACKAGE=([java-8-openjdk]='jre8-openjdk-headless')
declare -r _JAVA_RUNTIME_PATH_PREFIX='/usr/lib/jvm'
declare -r -A _JAVA_8_ARCH_PACKAGE_PATH_SUFFIXES=([jre8-openjdk-headless]='/java-8-openjdk/jre/bin')

function is_current_java_8 {
    local -r _CURRENT_JAVA="$(archlinux-java get)"
    if [ -z "${_JAVA_8_ARCH_RUNTIME_TO_PACKAGE[${_CURRENT_JAVA}]}" ]
    then
        return 1
    else
        return 0
    fi
}

function ensure_java_8 {
    if is_current_java_8
    then
        return 0
    else
        for _PACKAGE in "${_JAVA_8_ARCH_RUNTIME_TO_PACKAGE[@]}"
        do
            if [ -z "$_PACKAGE" ]
            then
                continue
            else
                local _PACKAGE_SUFFIX="${_JAVA_8_ARCH_PACKAGE_PATH_SUFFIXES[${_PACKAGE}]}"
                local _PACKAGE_PATH="$_JAVA_RUNTIME_PATH_PREFIX$_PACKAGE_SUFFIX"
                if [ -n "$_PACKAGE_SUFFIX" ] && [ -d "$_PACKAGE_PATH" ]
                then
                    export PATH="$_PACKAGE_PATH:$PATH"
                    return 0
                else
                    continue
                fi
            fi
        done
        echo 'Unable to find local Java 8 Runtime. This is probably a bug with the Arch Linux launcher script. Please report it at https://aur.archlinux.org/packages/metals' 1>&2
        exit 1
    fi
}

function build_cp {
    while read -r name
    do
        _CP="$name:$_CP"
    done <<< "$(find "$_INSTALL_DIR"/jars -regex '.*\.jar')"
}

function main {
    ensure_java_8

    build_cp

    # Java options taken from metals-emacs documentation
    # https://scalameta.org/metals/docs/editors/emacs.HTML
    exec java -XX:+UseG1GC -XX:+UseStringDeduplication -Xss4m -Xms100m -Dmetals.client="$_METALS_CLIENT" -cp "$_CP" scala.meta.metals.Main "$@"
}

main "$@"
