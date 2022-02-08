#!/usr/bin/env bash

# this script creates a copy of the current system-level
# StdEnv files of the Clean distribution and places them
# in the users home directory (under .local)

_install_dir="$HOME/.local/clean"

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
        if [ ! -d "$_install_dir/lib/StdEnv" ]; then
            echo "not initilised"
        else
            echo "initilised"
        fi
        ;;
    init)
        if [ -d "$_install_dir/lib/StdEnv" ]; then
            echo -n "already initilised, overwrite? [Y/n]: "
            read -r yn
            if [ "$yn" != "${yn#[Yy]}" ] ;then
                rm -rf "$_install_dir"
                cp -r /opt/clean-lang-bin "$_install_dir"
                echo "done"
            fi
        else
            [ -d "$_install_dir" ] || mkdir -p "$_install_dir"
            cp -r /opt/clean-lang-bin "$_install_dir"
            echo "done"
        fi
        $_install_dir/bin/patch_bin "$_install_dir/bin/clm" CLEANPATH "$_install_dir/lib/StdEnv"
        $_install_dir/bin/patch_bin "$_install_dir/bin/clm" CLEANLIB "$_install_dir/lib/exe"
        $_install_dir/bin/patch_bin "$_install_dir/bin/clm" CLEANILIB "$_install_dir/lib"
        echo " "
        echo "Remember to setup your environment paths as follows:"
        echo "export CLEAN_HOME=$_install_dir"
        echo "export PATH=\$PATH:\${CLEAN_HOME}/bin"
        echo "export MANPATH=\$MANPATH:\${CLEAN_HOME}/man"
        echo " "
        ;;
    deinit)
        if [ ! -d "$_install_dir/lib/StdEnv" ]; then
            echo "not initilised, nothing to do :("
        else
            rm -rf "$_install_dir"
            echo "done"
            echo " "
            echo "Remember to remove the environment paths for Clean."
            echo " "
        fi
        ;;
    *)
        echo "unknown command..."
        usage
        exit 1
        ;;
esac
