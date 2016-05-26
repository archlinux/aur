# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# mkinitcpio build time script

build_ssh_host_keys() {

    quiet "provide host server ssh keys"

    mkdir -p "/etc/dropbear"
    
    local keytype_list="rsa dsa ecdsa"
    local keytype source target
    for keytype in  $keytype_list; do
        source=$(keypath_openssh $keytype)
        target=$(keypath_dropbear $(keytype_dropbear $keytype))
        if [ -f "$target" ]; then
            plain "provision existing dropbear host key: $target"
        else
            if [ -f "$source" ] ; then
                plain "convert openssh to dropbear host key: $target"
                invoke   dropbearconvert openssh dropbear $source $target
            else
                plain "generate brand new dropbear host key: $target"
                invoke   dropbearkey -t $(keytype_dropbear $keytype) -f $target
            fi
        fi
    done

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
