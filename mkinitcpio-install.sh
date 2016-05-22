#!/bin/bash

help() {
    local pkgname="initrd-dropbear"
    local readme="/usr/share/mkinitcpio/$pkgname/readme.md"
    [ -f $readme ] && cat $readme 
}

build() {
    
    build_host
    
    build_user
        
    build_unit
    
    build_libs    
    
}

build_host() {

    quiet "Provide host server ssh keys"

    local etc_dropbear="/etc/dropbear"

    mkdir -p $etc_dropbear
    
    local keytype_list="rsa dsa ecdsa"
    local keytype source target
    for keytype in  $keytype_list; do
        source=$(keypath_openssh $keytype)
        target=$(keypath_dropbear $(keytype_dropbear $keytype))
        if [ -f $target ]; then
            quiet "Provision existing dropbear host key: $target"
        else
            if [ -f $source ] ; then
                plain "Convert openssh to dropbear host key: $target"
                invoke_command   dropbearconvert openssh dropbear $source $target
            else
                plain "Generate brand new dropbear host key: $target"
                invoke_command   dropbearkey -t $(keytype_dropbear $keytype) -f $target
            fi
        fi
    done

    add_full_dir $etc_dropbear
    
}

build_user() {

    quiet "Provide user login ssh keys"

    local source_list="\
    /etc/dropbear/root_key \
    /root/.ssh/authorized_keys \
    "

    local source=""
    local target_dir="/root/.ssh"
    local target_file="$target_dir/authorized_keys"
    
    for source in $source_list ; do 
        if [ -f $source ] ; then
            add_dir $target_dir
            plain "Add public key: $source initramfs: $target_file"
            invoke_command   cat $source >> $BUILDROOT/$target_file
            return 0
        fi
    done

    error "Missing public key in any of: $source_list"

}

build_unit() {

    quiet "Provide systemd units"

    local tag="/etc/initrd-release"
                
    # services

    local dir="/etc/systemd/system"
    add_dir $dir
    
    local unit_list=$(grep -ql "$tag" $dir/*.service)
    [[ $unit_list ]] || error "Missing any units in $dir with tag $tag"

    local unit
    for unit in $unit_list ; do
        quiet "Add unit: $unit"
        invoke_command   add_systemd_unit $unit
        invoke_command   systemctl --root $BUILDROOT enable $unit
    done
    
    # networks

    local dir="/etc/systemd/network"
    add_dir $dir

    local unit_list=$(grep -ql "$tag" $dir/*.network)
    [[ $unit_list ]] || error "Missing any units in $dir with tag $tag"
    
    local unit
    for unit in $unit_list ; do
        quiet "Add unit: $unit"
        invoke_command   add_file $unit
    done
                                                                
}

build_libs() {
    
    quiet "Provide library resources"
    
    add_checked_modules "/drivers/net/"
    
    add_binary "dropbear"
    
    add_dir "/var/run"
    add_dir "/var/log"
    
    invoke_command   touch "${BUILDROOT}"/var/log/lastlog
    
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

invoke_command() {
    local command="$@"
    local result=$($command 2>&1)
    case $? in
         0) quiet "Command success: $command"; return 0 ;;
         *) error "Command failure ($?): $command" ; echo "$result" ; return 1 ;;  
    esac
}
