#!/bin/bash

# This file is part of https://aur.archlinux.org/packages/initrd-dropbear/

help() {
    local pkgname="initrd-dropbear"
    local readme="/usr/share/$pkgname/readme.md"
    [ -f $readme ] && cat $readme 
}

build() {
    
    build_ssh_host_keys
    
    build_ssh_user_keys
        
    build_systemd_units
    
    build_resources
    
}

build_ssh_host_keys() {

    quiet "Provide host server ssh keys"

    local etc_dropbear="/etc/dropbear"

    mkdir -p $etc_dropbear
    
    local keytype_list="rsa dsa ecdsa"
    local keytype source target
    for keytype in  $keytype_list; do
        source=$(keypath_openssh $keytype)
        target=$(keypath_dropbear $(keytype_dropbear $keytype))
        if [ -f $target ]; then
            plain "Provision existing dropbear host key: $target"
        else
            if [ -f $source ] ; then
                plain "Convert openssh to dropbear host key: $target"
                invoke   dropbearconvert openssh dropbear $source $target
            else
                plain "Generate brand new dropbear host key: $target"
                invoke   dropbearkey -t $(keytype_dropbear $keytype) -f $target
            fi
        fi
    done

    invoke   add_full_dir $etc_dropbear
    
}

build_ssh_user_keys() {

    quiet "Provide user login ssh keys"

    local target="/root/.ssh/authorized_keys"

    local source_list="\
    /etc/dropbear/root_key \
    /root/.ssh/authorized_keys \
    "
    local source
    for source in $source_list ; do 
        if [ -f $source ] ; then
            plain "Add public key: $source initramfs: $target"
            invoke   add_file $source $target
            return 0
        fi
    done

    error "Missing public key in any of: $source_list"

}

build_systemd_units() {

    quiet "Provide systemd units"

    # NOTE: initramfs inclusion marker
    local tag="/etc/initrd-release"
                
    # services

    local dir="/etc/systemd/system"
    invoke   add_dir $dir
    
    local unit_list=$(grep -l "$tag" $dir/*.service)
    [[ $unit_list ]] || error "Missing any units in $dir with tag $tag"

    local unit
    for unit in $unit_list ; do
        quiet "Add unit: $unit"
        invoke   add_systemd_unit $unit
        invoke   systemctl --root $BUILDROOT enable $unit
    done
    
    # networks

    local dir="/etc/systemd/network"
    invoke   add_dir $dir

    local unit_list=$(grep -l "$tag" $dir/*.network)
    [[ $unit_list ]] || error "Missing any units in $dir with tag $tag"
    
    local unit
    for unit in $unit_list ; do
        quiet "Add unit: $unit"
        invoke   add_file $unit
    done
    
    # programs
    
    local dir="/etc/dropbear"
    invoke   add_dir $dir
    local prog_list=$(grep -l "$tag" $dir/*.sh)
    for prog in $prog_list ; do
        quiet "Add $prog"
        invoke   add_file "$prog" "$prog" 755
    done
                                                                
}

build_resources() {
    
    quiet "Provide dependency resources"
    
    invoke   add_checked_modules "/drivers/net/"

    # provided by add_systemd_unit
    #invoke   add_binary "dropbear"

    # expected by dropbear
    local temp=$(mktemp)
    invoke   add_dir "/var/run"
    invoke   add_dir "/var/log"
    invoke   add_file $temp "/var/log/lastlog"
    
}

keypath_openssh() {
    local type=$1
    echo "/etc/ssh/ssh_host_${type}_key"
}

keypath_dropbear() {
    local type=$1
    echo "/etc/dropbear/dropbear_${type}_host_key"
}

keytype_dropbear() {
    local type=$1
    [[ $type == "dsa" ]] && type="dss" 
    echo "${type}"
}

invoke() {
    local command="$@"
    local result; result=$($command 2>&1); status=$?
    case $status in
         0) quiet "Invoke success: $command\n$result\n"; return 0 ;;
         *) error "Invoke failure ($status): $command \n$result\n" ; return 1 ;;  
    esac
}


# bug fix for https://bugs.archlinux.org/task/42396

add_systemd_unit() {
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
                map add_systemd_unit "${values[@]}"
                ;;
            Exec*)
                # don't add binaries unless they are required
                if [[ ${values[0]:0:1} != '-' ]]; then
                    add_binary "${values[0]}"
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
            add_systemd_unit ${dep##*/}
        done
    fi
}
