# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# mkinitcpio build time functions for X-SystemdTool/InitrdInvoke

# can use mkinitcpio /usr/lib/initcpio/functions.sh
# $BUILDROOT - mkinitcpio image build destination dir
# quiet() - output to console depending on mkinitcpio "-v" option
# plain() - output to console always

# enforce specific login shell in /etc/passwd
build_root_shell() {
    local shell="/bin/sh"
    local search="(root):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*):([^:]*)"
    local replace="\1:\2:\3:\4:\5:\6:${shell}"
    local target="$BUILDROOT/etc/passwd"
    run_command sed -i -r -e "s|${search}|${replace}|" "$target"
}

# ensure dropbear server host keys
build_ssh_host_keys() {

    quiet "provide host server ssh keys"

    mkdir -p "/etc/dropbear"
    
    local keytype_list="rsa dsa ecdsa"
    local keytype source target
    for keytype in  $keytype_list; do
        source=$(keypath_openssh "$keytype")
        target=$(keypath_dropbear $(keytype_dropbear "$keytype"))
        if [ -f "$target" ]; then
            plain "provision existing dropbear host key: $target"
        else
            if [ -f "$source" ] ; then
                plain "convert openssh to dropbear host key: $target"
                run_command   dropbearconvert openssh dropbear "$source" "$target"
            else
                plain "generate brand new dropbear host key: $target"
                run_command   dropbearkey -t $(keytype_dropbear "$keytype") -f "$target"
            fi
        fi
    done

}

# location of server host keys used by openssh
keypath_openssh() {
    local type=$1
    echo "/etc/ssh/ssh_host_${type}_key"
}

# location of server host keys used by dropbear
keypath_dropbear() {
    local type="$1"
    echo "/etc/dropbear/dropbear_${type}_host_key"
}

# re-map ssh key type from openssh to dropbear
keytype_dropbear() {
    local type="$1"
    [[ $type == "dsa" ]] && type="dss" 
    echo "${type}"
}

# safety wrapper for external commands
run_command() {
    local command="$@"
    local result; result=$($command 2>&1); status=$?
    case "$status" in
         0) quiet "command success: $command\n$result\n"; return 0 ;;
         *) error "command failure ($status): $command \n$result\n" ; return 1 ;;  
    esac
}
