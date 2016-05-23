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
    
    #build_libs
    
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
            plain "Provision existing dropbear host key: $target"
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

    local target="/root/.ssh/authorized_keys"

    local source_list="\
    /etc/dropbear/root_key \
    /root/.ssh/authorized_keys \
    "
    local source
    for source in $source_list ; do 
        if [ -f $source ] ; then
            plain "Add public key: $source initramfs: $target"
            invoke_command   add_file $source $target
            return 0
        fi
    done

    error "Missing public key in any of: $source_list"

}

build_unit() {

    quiet "Provide systemd units"

    # NOTE: initramfs inclusion marker
    local tag="/etc/initrd-release"
                
    # services

    local dir="/etc/systemd/system"
    add_dir $dir
    
    local unit_list=$(grep -l "$tag" $dir/*.service)
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

    local unit_list=$(grep -l "$tag" $dir/*.network)
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
    local result; result=$($command 2>&1); status=$?
    case $status in
         0) quiet "Command success: $command"; return 0 ;;
         *) error "Command failure ($status): $command" ; echo "$result" ; return 1 ;;  
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
