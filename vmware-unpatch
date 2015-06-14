#!/bin/bash -e

# Source common functions
. /usr/share/vmware-patch/common-functions.sh

# Help message
usage() {
    echo "Usage: $(basename $0) [-v/-V|-h]"
    echo "Revert the VMware modules sources."
    echo
    echo "Available options:"
    echo "  -v, -V, --version   Print version information"
    echo "  -h, --help          Print this help"
}

# Flags
while [[ $1 ]]; do
    # Define actions
    case "$1" in
        -v | -V | --version)   print_version; exit 0 ;;
        -h | --help)           usage; exit 0 ;;
        -*)                    echo "$(basename $0): error: bad argument: $1"
                               echo
                               usage $1; exit 0 ;;
        *) break ;;
    esac
    shift
done

# Make sure we are root
root_check

# Is a VMware product installed?
vmware_check

# Product name
set_product_name

# Remove leftover module locations
remove_leftover_module_dirs

cd /usr/lib/vmware/modules/

# Remove old backups
remove_old_backups

# Revert
cd /usr/lib/vmware/modules/
if [[ -d source-$ver ]]; then
    msg "Reverting $name v$ver module sources.."
    msg2 "Removing $(readlink -f source)/"
    rm -r source/

    msg2 "Renaming backup: $(readlink -f source-$ver)/ -> $(readlink -f source)/"
    mv "source-$ver/" source/

    msg3 "Done."
else  # Nothing found
    error "No backups found."
    exit
fi
