#!/usr/bin/env bash

# this script creates a copy of the current system-level
# StdEnv files of the Clean distribution and places them
# in the users home directory (under .cache)

_install_dir="$HOME/.cache/clean-itasks-dev-bin"

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
        if [ ! -d "$_install_dir/lib" ]; then
            echo "not initilised"
        else
            echo "initilised"
        fi
        ;;
    init)
        if [ -d "$_install_dir/lib" ]; then
            echo -n "already initilised, overwrite? [Y/n]: "
            read -r yn
            if [ "$yn" != "${yn#[Yy]}" ] ;then
                rm -rf "$_install_dir"
                cp -r /opt/clean-itasks-dev-bin/lib "$_install_dir/"
                echo "done"
            fi
        else
            [ -d "$_install_dir" ] || mkdir -p "$_install_dir"
            cp -r /opt/clean-itasks-dev-bin/lib "$_install_dir/"
            echo "done"
        fi
        ;;
    deinit)
        if [ ! -d "$_install_dir/lib" ]; then
            echo "not initilised, nothing to do :("
        else
            rm -rf "$_install_dir"
            echo "done"
        fi
        ;;
    *)
        echo "unknown command..."
        usage
        exit 1
        ;;
esac
