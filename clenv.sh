#!/usr/bin/env bash

# this script copies over the entire directory tree
# of the clean project into your homedirectory.

_install_dir="$HOME/.cache/clean-itasks-dev-bin"
_source_dir=/opt/clean-itasks-dev-bin

usage () {
    echo "USAGE: clenv [cmd]" >&2
    echo ""
    echo "Commands: status, init, deinit"
}

if [ $# -lt 1 ]; then
    usage
    exit 0
fi

case $1 in
    status)
        if [ ! -d "$_install_dir" ]; then
            echo "not initilised"
        else
            echo "initilised"
        fi
        ;;
    init)
        if [ -d "$_install_dir" ]; then
            echo -n "already initilised, overwrite? [Y/n]: "
            read -r yn
            if [ -z "$yn" ] || [ "$yn" != "${yn#[Yy]}" ] ;then
                rm -rf "${_install_dir:?}"/*
                cp -r "${_source_dir:?}"/* "$_install_dir/"
                echo "done"
            else
                echo "skipped"
            fi
        else
            [ -d "$_install_dir" ] || mkdir -p "$_install_dir"
            cp -r "${_source_dir:?}"/* "$_install_dir/"
            echo "done"
        fi
        ;;
    deinit)
        if [ ! -d "$_install_dir" ]; then
            echo "not initilised, nothing to do :("
        else
            rm -rf "${_install_dir:?}"
            echo "done"
        fi
        ;;
    *)
        echo "unknown command..."
        usage
        exit 1
        ;;
esac
