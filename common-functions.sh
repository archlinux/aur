#!/bin/bash

# Some colored makepkg-like functions
msg() {
    printf "${green}==>${bold} $1${all_off}\n"
}

msg_yellow() {
    printf "${yellow}==>${bold} $1${all_off}\n"
}

msg2() {
    printf "${blue}  ->${bold} $1${all_off}\n"
}

msg2_yellow() {
    printf "${yellow}  ->${bold} $1${all_off}\n"
}

read_msg2() {
    read -p "${blue}  ->${bold} $1${all_off}"
}

msg3() {
    printf "${yellow}    ->${bold} $1${all_off}\n"
}

error() {
    printf "${red}==> error:${bold} $1${all_off}\n"
}

error2() {
    printf "${red}    *${bold} $1${all_off}\n"
}

# Colors
all_off="$(tput sgr0)"
bold="${all_off}$(tput bold)"
blue="${bold}$(tput setaf 4)"
green="${bold}$(tput setaf 2)"
red="${bold}$(tput setaf 1)"
yellow="${bold}$(tput setaf 3)"

# Version information
print_version() {
    echo "$(basename $0) $(pacman -Q vmware-patch | cut -d ' ' -f2)"
    echo "Copyright (c) 2013-2015  Nobody"
    echo
    echo "THIS SCRIPT IS PROVIDED AS-IS FOR ANY PURPOSE WHATSOEVER. YOU ARE FREE TO SHARE IT, MODIFY IT,"
    echo "TAKE CREDIT OF IT, AND SELL IT ON THE STREETS."
    echo
    echo "FIGHT THE POWER."
}

# Make sure we are root
root_check() {
    if (( $EUID != 0 )); then
        error "This script needs to be run as root."
        exit 1
    fi
}

# Is a VMware product installed?
vmware_check() {
    if [[ ! -f /usr/bin/vmware-installer ]]; then
        error "No VMware product found. Exiting.."
        exit 1
    fi
}

# Product name
set_product_name() {
    ver=$(vmware-installer -l |& grep -Po "(player|workstation) *\K(\d+\.){2}\d+")
    if vmware-installer -l |& grep -q "workstation"; then
        name="VMware Workstation"
    else
        name="VMware Player (Plus)"
    fi
}

# Select kernel from menu
menu() {
    # Don't show previous menu
    clear

    # Menu
    echo "Select kernels for which to build modules (leave empty for current kernel):"
    for i in ${!kernels_all[@]}; do 
        printf "%3d%s) %s\n" "$((i+1))" "${choices[i]:- }" "${kernels_all[i]}"
    done
}

# Wrapper function
list_kernels() {
    # Wait for Enter
    while menu && read -rp "Press Enter when done: " num && [[ $num ]]; do
        # Select correct item
        (( num -- ))

        # Set plus mark (+)
        if [[ ${choices[num]} ]]; then
            choices[num]=""
        else
            choices[num]="+"
        fi
    done

    # Chosen kernels
    for i in ${!kernels_all[@]}; do 
        if [[ ${choices[i]} ]]; then
            kernels+=("${kernels_all[i]}")
        fi
    done
}

# Compile leftover module locations
remove_leftover_module_dirs() {
    for i in /usr/lib/modules/*; do
        if [[ $(ls "$i") = misc ]]; then
            misc+=("$i")
        fi
    done

    # Remove them
    if [[ $misc ]]; then
        msg_yellow "Removing leftover module location.."
        for i in ${misc[@]}; do
            msg2 "$i/"
            rm -r "$i"
        done
    fi
}

# Remove old backups
# ls: supports multiple arguments as opppsed to [ -d ]
remove_old_backups() {
    if ls -d source-*.*/ 2>/dev/null | grep -qv "$ver/"; then
        msg_yellow "Cleaning up old backups.."
        # Print full paths
        for i in $(readlink -f source-*.*/ | grep -v "$ver"); do
            msg2 "$i/"
            rm -r "$i"
        done
    fi
}

# Patch function
patch_sources() {
    if [[ $verbose ]]; then
        msg3 "Patching.."
        patch -p0 -f -i "../$patch"
    else
        patch -p0 -s -f -i "../$patch"
    fi
}

# Print vmware-modconfig-*.logs and exit
print_logs() {
    for log in /tmp/vmware-root/vmware-modconfig-*.log; do
        error2 "$log"
    done
    exit 1
}
