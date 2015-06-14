#!/bin/bash -e

# Source common functions
. /usr/share/vmware-patch/common-functions.sh

# Help message
usage() {
    echo "Usage: $(basename $0) [-f|-v|-V|-h]"
    echo "Automate the compilation of VMware modules for Arch Linux."
    echo
    echo "Available options:"
    echo "  -a, --all           Build for all kernels" 
    echo "  -f, --force         Force reinstallation, even if modules are already built"
    echo "  -k, --kernel        Select which kernel(s) to build to from menu" 
    echo "  -v, --verbose       Use verbose output in patching and vmware-modconfig"
    echo "  -V, --version       Print version information"
    echo "  -h, --help          Print this help"
}

# Flags
while [[ $1 ]]; do
    # Can't change $1
    opt=$1

    # Parse current one
    while [[ $opt != - ]]; do
        # Define actions
        case $opt in
            -a* | --all-kernels)  all=1 ;;
            -f* | --force)        force=1 ;;
            -k* | --kernel)       kernel=1 ;; 
            -v* | --verbose)      verbose=1 ;;
            -V* | --version)      print_version; exit 0 ;;
            -h* | --help)         usage; exit 0 ;;
            -*)                   echo "$(basename $0): error: bad argument: $opt"
                                  echo
                                  usage $1; exit 0 ;;
            *) break ;;
        esac

        # Support single dash (vmware-patch -fv)
        # ${opt#-:[*]}: Remove first match
        nextopt=${opt#-[afkv]}
        if [[ $opt != $nextopt ]]; then
            # Multiple short flags
            opt=-$nextopt
        else
            # Long form (--force/--verbose)
            break
        fi
    done
    shift
done

# Make sure we are root
root_check

# Is a VMware product installed?
vmware_check

# Product name
set_product_name

# Make sure vmware.service includes our USB Arbitrator service
if ! grep -q "usbarbitrator" /usr/lib/systemd/system/vmware.service; then
    msg "Updating vmware.service.."
    sed '/Description/a Requires=vmware-usbarbitrator.service\nBefore=vmware-usbarbitrator.service' \
        -i /usr/lib/systemd/system/vmware.service
fi

# Use VMware's bundled libcurl.so.4 to prevent crashes at startup/checking for updates
for script in vmware vmplayer; do
    if [[ -f /usr/bin/$script ]]; then
        if ! grep -q "libcurl" /usr/bin/$script; then
            sed '/$vmmon/a\   export LD_LIBRARY_PATH=/usr/lib/vmware/lib/libcurl.so.4' \
                -i /usr/bin/$script
        fi
    fi
done

# Make sure there's a version in /etc/arch-release for Workstation 9 / Player 5
# https://wiki.archlinux.org/index.php?title=VMware&oldid=274532#2.29_The_vmware-usbarbitrator_binary_is_segfaulting
if [[ $ver = 9.* ]] || [[ $ver = 5.* ]]; then
    if [[ ! $(cat /etc/arch-release) ]]; then
        msg "Updating /etc/arch-release.."
        curl -s https://www.archlinux.org/releng/releases/ | grep -Pom1 'for \K[^"]*' > /etc/arch-release
    fi
fi

# Fix VMCI/VSOCK loading for Workstation 10 / Player (Plus) 6 and earlier
if [[ $ver != 11.* ]] && [[ $ver != 7.* ]]; then
    if grep -q '$vsock_alias' /etc/init.d/vmware; then
        sed -e 's/mod=$(vmwareRealModName $vmci $vmci_alias)/mod=vmci/' \
            -e 's/mod=$(vmwareRealModName $vsock $vsock_alias)/mod=vsock/' \
          -i /etc/init.d/vmware
    fi
else
    if grep -q 'mod=vmci' /etc/init.d/vmware; then
        # Revert the tweak for Workstation 11 / Player (Pro) 7
        sed -e 's/mod=vmci/mod=$(vmwareRealModName $vmci $vmci_alias)/' \
            -e 's/mod=vsock/mod=$(vmwareRealModName $vsock $vsock_alias)/' \
          -i /etc/init.d/vmware
    fi
fi

# Remove leftover module locations
remove_leftover_module_dirs
cd /usr/lib/vmware/modules/

# Remove old backups
remove_old_backups

# Available kernels
kernels_all=($(cat /usr/lib/modules/extramodules-*/version))

# Kernel(s) to build to
if [[ ! $all ]]; then
    if [[ ! $kernel ]]; then
        kernels=$(uname -r)
    else
        list_kernels
    fi
else
    kernels=${kernels_all[@]}
fi

# Build for however many kernels specified
for kernel in ${kernels[@]}; do
    # Make sure the directory exists
    if [[ ! -d /usr/lib/modules/$kernel/ ]]; then
        error "/usr/lib/modules/$kernel/ not found. Exiting.."
        exit 1
    fi

    # Support the '-f' flag
    # 1) Have we already built (vmnet is built last)?
    # 2) Don't check this until we've removed the leftovers
    if [[ ! $force ]] && [[ -f /usr/lib/modules/$kernel/misc/vmnet.ko ]]; then
        if [[ $verbose ]]; then
            msg "Verifying current state.."
        fi
        error "VMware modules already installed (use '-f' to override). Exiting.."
        exit 1
    fi

    # Unload conflicting in-kernel modules in less than Workstation 11 / Player (Pro) 7
    if [[ $ver != 11.* ]] && [[ $ver != 7.* ]]; then
        rmmod "vsock" "vmw_vsock_vmci_transport" "vmw_vmci" 2>/dev/null || true
    else
        modprobe "vsock" "vmw_vsock_vmci_transport" "vmw_vmci" 2>/dev/null || true
    fi

    # Detect applicable patches (/usr/lib/vmware/modules/patches/[mod]-[ver]-[kernel].patch)
    unset patches
    for patch in patches/*; do
        # Some variables
        ver_patch=$(echo $patch | cut -d "-" -f2)
        kernel_patch=$(echo $patch | grep -Po ".*-\K\d+\.\d+")
        kernel_major=$(echo $kernel | cut -d "." -f-2)

        # Sync VMware Player (Plus) version by incrementing by 4
        ver2=$ver
        if [[ $name =~ Player ]]; then
            major=$(( ${ver/.*} + 4 ))
            ver2=$major.${ver#*.}
        fi

        # Is product version not lower and kernel version not higher in patch name?
        if (( $(vercmp "$ver_patch" "$ver2") >= 0 )) && (( $(vercmp "$kernel_patch" "$kernel_major") <= 0 )); then
            patches+=("$patch")
        fi
    done

    # Patch
    # 1) Make sure we can build
    # 2) &>/dev/null: hide all output (STDIN/STDERR)
    msg "Patching $name v$ver for kernel $kernel.."
    if [[ $patches ]]; then
        # Create a backup/Revert
        if [[ ! -d source-$ver ]]; then
            msg2_yellow "Backing up.."
            cp -r source/ "source-$ver/"
        else
            # Get the original sources from the backup (invalidate the need for 'vmware-unpatch')
            cp "source-$ver/"* source/
        fi

        # cd in place
        cd source

        # Loop modules that require patching (vmci, vmmon, vmnet and/or vsock)
        # sort -u: prevent duplicate entries
        for mod in $(echo ${patches[@]} | grep -Po "s/\K[^-]*" | sort -u); do
            # Print name
            msg2 "[$mod]"

            # Untar
            if [[ $verbose ]]; then
                msg3 "Extracting archives.."
            fi
            tar -xf "$mod.tar"

            # Loop through applicable patches
            # printf '%s\n': print ${patches[@]} in separate lines for grepping
            for patch in $(printf '%s\n' "${patches[@]}" | grep "$mod"); do
                # Patch
                if ! patch_sources; then
                    error "Failed to apply '$(basename "$patch")'"
                    read_msg2 "Continue? (Y/n) "
                    if [[ $REPLY != [Yy] ]]; then
                        # Revert
                        msg "Reverting.."
                        cd ..
                        rm -r source/
                        mv "source-$ver/" source/

                        # Exit
                        msg2 "Done."
                        exit 1
                    fi
                fi
            done

            # Tar patched modules
            if [[ $verbose ]]; then
                msg3 "Recreating archives.."
            fi
            tar -cf "$mod.tar" "$mod-only"

            # Leftovers
            rm -r "$mod-only"
        done

        # Return
        cd ..
    else
        msg2 "No patching required.."
    fi

    # Install
    msg "Installing modules.."
    if [[ $verbose ]]; then
        # Run vmware-modconfig
        if ! vmware-modconfig --console --install-all -k "$kernel"; then
            # See logs
            if ls /tmp/vmware-root/vmware-modconfig-*.log &>/dev/null; then
                error "Unable to build. See:"
                print_logs
            else 
                error "Unable to build. See logs in /tmp/vmware-root/"
            fi
        else
            msg2 "Done."
        fi
    else
        # Run vmware-modconfig
        if ! vmware-modconfig --console --install-all -k "$kernel" &>/dev/null; then
            # See logs
            if ls /tmp/vmware-root/vmware-modconfig-*.log &>/dev/null; then
                error "Unable to build. Re-run with '-v' (--verbose) or see:"
                print_logs
            else
                error "Unable to build. See logs in /tmp/vmware-root/"
            fi
        else
            msg2 "Done."
        fi
    fi
done
