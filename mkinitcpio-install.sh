#!/bin/bash

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# mkinitcpio entry point
help() {
    local pkgname="mkinitcpio-systemd-tool"
    local readme="/usr/share/$pkgname/README.md"
    [ -f "$readme" ] && cat "$readme" 
}

# mkinitcpio entry point
build() {
    
    quiet "provision initrd systemd units"

    # initramfs inclusion marker
    local tag="ConditionPathExists=/etc/initrd-release"
                
    # user provided system units
    local dir="/etc/systemd/system"
    add_dir $dir
    
    local unit_list=$(grep -l "$tag" $dir/*.service)
    [ -n "$unit_list" ] || error "Missing any units in $dir with entry $tag"

    local unit
    for unit in $unit_list ; do
        quiet "add unit: $unit"
        add_systemd_unit_X "$unit"
        invoke   systemctl --root "$BUILDROOT" enable "$unit"
    done
    
}

invoke() {
    local command="$@"
    local result; result=$($command 2>&1); status=$?
    case "$status" in
         0) quiet "Invoke success: $command\n$result\n"; return 0 ;;
         *) error "Invoke failure ($status): $command \n$result\n" ; return 1 ;;  
    esac
}

# function add_systemd_unit with extra bug fixes for:
# https://bugs.archlinux.org/task/42396
# https://bugs.archlinux.org/task/49458
# https://bugs.archlinux.org/task/49460

# original source:
# https://git.archlinux.org/svntogit/packages.git/tree/trunk/initcpio-install-systemd?h=packages/systemd

add_systemd_unit_X() {
    # Add a systemd unit file to the initcpio image. Hard dependencies on binaries
    # and other unit files will be discovered and added.
    #   $1: path to rules file (or name of rules file)

    local unit= rule= entry= key= value= binary= dep=

    unit=$(basename $1)
    plain "systemd unit $unit"
    
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
            Exec*|InitrdBinary)
                # don't add binaries unless they are required
                if [[ ${values[0]:0:1} != '-' ]]; then
                    local exec="${values[0]}"
                    if [[ -f $BUILDROOT$exec ]] ; then
                         quiet "reuse present binary $exec"
                    else
                         plain "provision new binary $exec"
                         add_binary "$exec"
                    fi
                fi
                ;;
            InitrdPath)
                # auto provision resources
                # format:
                # InitrdPath=/etc/folder [glob=*.sh]
                # InitrdPath=/etc/file [source=/lib/file] [mode=755]
                local source= target= mode= glob= args= optional=
                target="${values[0]}" ; args="${values[@]:1:9}" 
                [ -n "$args" ] && local $(echo "$args")
                [ -n "$source" ] || source="$target"
                if [ -e "$BUILDROOT$target" ] ; then
                    quiet "reuse present path $target"
                elif [ -d "$source" ] ; then 
                    plain "provision new dir $source $glob"
                    add_full_dir "$source" "$glob"
                elif [ -f "$source" ] ; then
                    plain "provision new file $source -> $target $mode"
                    add_file "$source" "$target" "$mode"
                elif [ "$create" = "yes" ] ; then
                    if [ "${target: -1}" = "/" ] ; then
                        plain "create empty dir $target"
                        add_dir "$target"
                    else
                        plain "create empty file $target $mode"
                        add_file "$(mktemp)" "$target" "$mode"
                    fi
                elif [ "$optional" = "yes" ] ; then
                    plain "skip optional path $source -> $target"
                else
                    error "invalid source path $source"
                fi
                ;;
            InitrdInvoke)
                # invoke build time function form script file
                # format: InitrdInvoke=/path/script command=function-name 
                local script= command= args= 
                script="${values[0]}" ; args="${values[@]:1:9}" 
                [ -n "$args" ] && local $(echo "$args")
                if [ -z "$script" ] ; then
                    error "missing InitrdInvoke script in unit $unit"
                elif [ -z "$command" ] ; then
                    error "missing command for script $script in unit $unit"
                else
                    plain "invoke $command for script $script in unit $unit"
                    # use sub shell for safety
                    (source "$script" ; "$command")
                fi
                ;;
            InitrdCall)
                # invoke build time code in-line
                # format: InitrdCall=bash-code-in-line 
                local code= 
                code=$(echo "${values[@]}")
                if [ -z "$code" ] ; then
                    error "missing InitrdCall code in unit $unit"
                else
                    plain "call in-line [$code] in unit $unit"
                    # FIXME needs sub shell, but that breaks some of `/usr/lib/initcpio/functions.sh`
                    $code 
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
