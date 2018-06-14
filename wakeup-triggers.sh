#!/usr/bin/bash

# This is a script to disable all wakeup triggers but the power button (PWRB)
# Based on the workaround provided for the problem described on Arch Wiki
# https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Instantaneous_wakeups_from_suspend
#
# @author Sávio Carlos Martins Costa (saviocmc at protonmail dot com)

# Sets the character of separation to be the new line \n (the default is a space)
IFS=$'\n'

WAKEUP=/proc/acpi/wakeup
CONFIG=/etc/wakeup-triggers.conf
BACKUP=/tmp/wakeup-triggers

backupAndDisableAllCurrentTriggers() {
    enabledTriggers=($(cat $WAKEUP | grep "enable"))
    for trigger in "${enabledTriggers[@]}"; do
        triggerCode=${trigger:0:4}
        echo $triggerCode >> $BACKUP
        echo $triggerCode > $WAKEUP
    done
}

enableSelectedTriggers() {
    selectedTriggers=($(cat $CONFIG | grep --invert-match '#' ))
    for trigger in "${selectedTriggers[@]}"; do
        echo $trigger > $WAKEUP
    done
}

restoreBackup() {
    enabledTriggers=($(cat $WAKEUP | grep "enable"))
    for trigger in "${enabledTriggers[@]}"; do
        triggerCode=${trigger:0:4}
        echo $triggerCode > $WAKEUP
    done
    backupTriggers=($(cat $BACKUP))
    for trigger in "${backupTriggers[@]}"; do
        echo $trigger > $WAKEUP
    done
    rm $BACKUP
}

start() {
    backupAndDisableAllCurrentTriggers
    enableSelectedTriggers
    exit 0
}

stop () {
    restoreBackup
    exit 0
}

case "$1" in
    "start") start;;
    "stop") stop;;
    *) exit 1;;
esac