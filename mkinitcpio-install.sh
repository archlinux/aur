#!/bin/bash

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

help() {
    local pkgname="mkinitcpio-systemd-tool"
    local readme="/usr/share/$pkgname/README.md"
    [ -f "$readme" ] && cat "$readme" 
}

build() {
    
    build_ssh_host_keys
    
    build_systemd_units
    
    build_resources
    
}

build_ssh_host_keys() {

    quiet "Provide host server ssh keys"

    local etc_dropbear="/etc/dropbear"

    mkdir -p "$etc_dropbear"
    
    local keytype_list="rsa dsa ecdsa"
    local keytype source target
    for keytype in  $keytype_list; do
        source=$(keypath_openssh $keytype)
        target=$(keypath_dropbear $(keytype_dropbear $keytype))
        if [ -f "$target" ]; then
            plain "Provision existing dropbear host key: $target"
        else
            if [ -f "$source" ] ; then
                plain "Convert openssh to dropbear host key: $target"
                invoke   dropbearconvert openssh dropbear $source $target
            else
                plain "Generate brand new dropbear host key: $target"
                invoke   dropbearkey -t $(keytype_dropbear $keytype) -f $target
            fi
        fi
    done

    add_full_dir $etc_dropbear
    
}

build_systemd_units() {

    quiet "Provide systemd units"

    # initramfs inclusion marker
    local tag="ConditionPathExists=/etc/initrd-release"
                
    # user provided system units
    local dir="/etc/systemd/system"
    add_dir $dir
    
    local unit_list=$(grep -l "$tag" $dir/*.service)
    [ -z "$unit_list" ] || error "Missing any units in $dir with tag $tag"

    local unit
    for unit in $unit_list ; do
        quiet "Add unit: $unit"
        add_systemd_unit_X "$unit"
        invoke   systemctl --root "$BUILDROOT" enable "$unit"
    done
    
}

build_resources() {
    
    quiet "Provide dependency resources"
    
    add_checked_modules "/drivers/net/"

    build_resources_dropbear
}

build_resources_dropbear() {
    local temp=$(mktemp)
    add_dir "/var/run"
    add_dir "/var/log"
    add_file "$temp" "/var/log/lastlog"
}

keypath_openssh() {
    local type=$1
    echo "/etc/ssh/ssh_host_${type}_key"
}

keypath_dropbear() {
    local type="$1"
    echo "/etc/dropbear/dropbear_${type}_host_key"
}

keytype_dropbear() {
    local type="$1"
    [[ $type == "dsa" ]] && type="dss" 
    echo "${type}"
}

invoke() {
    local command="$@"
    local result; result=$($command 2>&1); status=$?
    case "$status" in
         0) quiet "Invoke success: $command\n$result\n"; return 0 ;;
         *) error "Invoke failure ($status): $command \n$result\n" ; return 1 ;;  
    esac
}

# add_systemd_unit with extra bug fixes for:
# https://bugs.archlinux.org/task/42396
# https://bugs.archlinux.org/task/49458
# https://bugs.archlinux.org/task/49460

add_systemd_unit_X() {
    # Add a systemd unit file to the initcpio image. Hard dependencies on binaries
    # and other unit files will be discovered and added.
    #   $1: path to rules file (or name of rules file)

    local unit= rule= entry= key= value= binary= dep=

    unit=$(basename $1)
    unit=$(PATH=/etc/systemd/system:/usr/lib/systemd/system:/lib/systemd/system type -P "$unit")
    if [[ -z $unit ]]; then
        # complain about not found unit file
        return 1
    fi

    add_file "$unit"

    while IFS='=' read -r key values; do
        read -ra values <<< "$values"

        case $key in
            Requires|OnFailure)
                # only add hard dependencies (not Wants)
                map add_systemd_unit_X "${values[@]}"
                ;;
            Exec*)
                # don't add binaries unless they are required
                if [[ ${values[0]:0:1} != '-' ]]; then
                    local exec="${values[0]}"
                    if [[ -f $BUILDROOT$exec ]] ; then
                         quiet "reuse present exec $exec"
                    else
                         plain "provision new exec $exec"
                         add_binary "$exec"
                    fi
                fi
                ;;
            ProvisionInitrdPath)
                # auto provision resources
                # format:
                # ProvisionInitrdPath=/etc/folder [glob=*.sh]
                # ProvisionInitrdPath=/etc/file [source=/lib/file] [mode=755]
                local source= mode= glob=
                local target="${values[0]}"
                local args="${values:1}" ; local "$args"
                [ -n "$source" ] || source="$target"
                if [ -e "$BUILDROOT$target" ] ; then
                    quiet "reuse present path $target"
                else
                    if [ -d "$source" ] ; then 
                        plain "provision new path $source $glob"
                        add_full_dir "$source" "$glob"
                    else if [ -f "$source" ] ; then
                        plain "provision new path $source -> $target $mode"
                        add_file "$source" "$target" "$mode"
                    else
                        error "invalid source path $source"
                    fi
                fi
                ;;
        esac

    done <"$unit"

    # preserve reverse soft dependency
    for dep in {/usr,}/lib/systemd/system/*.wants/${unit##*/}; do
        if [[ -L $dep ]]; then
            add_symlink "$dep"
        fi
    done

    # add hard dependencies
    if [[ -d $unit.requires ]]; then
        for dep in "$unit".requires/*; do
            add_systemd_unit_X ${dep##*/}
        done
    fi
}
