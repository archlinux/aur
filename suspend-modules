#!/bin/bash

case $1 in
    pre)
        for mod in $(</etc/suspend-modules.conf); do
            rmmod $mod
        done
    ;;
    post)
        for mod in $(</etc/suspend-modules.conf); do
            modprobe $mod
        done
    ;;
esac
