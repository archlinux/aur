#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion
# region import
# shellcheck source=./module.sh
source "$(dirname "${BASH_SOURCE[0]}")/module.sh"
bl.module.import bashlink.logging
# endregion
bl_tools_is_defined() {
    # shellcheck disable=SC2034
    local __doc__='
    Tests if variable is defined (can also be empty)

    >>> local foo="bar"
    >>> bl.tools.is_defined foo; echo $?
    >>> [[ -v foo ]]; echo $?
    0
    0
    >>> local defined_but_empty=""
    >>> bl.tools.is_defined defined_but_empty; echo $?
    0
    >>> bl.tools.is_defined undefined_variable; echo $?
    1
    >>> set -o nounset
    >>> bl.tools.is_defined undefined_variable; echo $?
    1
    Same Tests for bash < 4.3
    >>> bl_tools__bash_version_test=true
    >>> local foo="bar"
    >>> bl.tools.is_defined foo; echo $?
    0
    >>> bl_tools__bash_version_test=true
    >>> local defined_but_empty=""
    >>> bl.tools.is_defined defined_but_empty; echo $?
    0
    >>> bl_tools__bash_version_test=true
    >>> bl.tools.is_defined undefined_variable; echo $?
    1
    >>> bl_tools__bash_version_test=true
    >>> set -o nounset
    >>> bl.tools.is_defined undefined_variable; echo $?
    1
    '
    (
    set +o nounset
    if ((BASH_VERSINFO[0] >= 4)) && ((BASH_VERSINFO[1] >= 3)) \
            && [ -z "${bl_tools__bash_version_test:-}" ]; then
        [[ -v "${1:-}" ]] || exit 1
    else # for bash < 4.3
        # NOTE: ${varname:-foo} expands to foo if varname is unset or set to the
        # empty string; ${varname-foo} only expands to foo if varname is unset.
        # shellcheck disable=SC2016
        eval '! [[ "${'"${1}"'-this_variable_is_undefined_!!!}"' \
            ' == "this_variable_is_undefined_!!!" ]]'
        exit $?
    fi
    )
}
alias bl.tools.is_defined="bl_tools_is_defined"
bl_tools_is_empty() {
    local __doc__='
    Tests if variable is empty (undefined variables are not empty)

    >>> local foo="bar"
    >>> bl.tools.is_empty foo; echo $?
    1
    >>> local defined_and_empty=""
    >>> bl.tools.is_empty defined_and_empty; echo $?
    0
    >>> bl.tools.is_empty undefined_variable; echo $?
    1
    >>> set -u
    >>> bl.tools.is_empty undefined_variable; echo $?
    1
    '
    local variable_name="$1"
    bl.tools.is_defined "$variable_name" || return 1
    [ -z "${!variable_name}" ] || return 1
}
alias bl.tools.is_empty="bl_tools_is_empty"
bl_tools_is_main() {
    local __doc__='
    Returns true if current script is being executed.

    >>> # NOTE: This test passes because "is_main" is called by "doctest.sh"
    >>> # which is being executed.
    >>> bl.tools.is_main && echo yes
    yes
    '
    [[ "${BASH_SOURCE[1]}" = "$0" ]]
}
alias bl.tools.is_main="bl_tools_is_main"
bl_tools_unique() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    >>> local foo="a\nb\na\nb\nc\nb\nc"
    >>> echo -e "$foo" | bl.tools.unique
    a
    b
    c
    '
    nl "$@" | sort --key 2 | uniq --skip-fields 1 | sort --numeric-sort | \
        sed 's/\s*[0-9]\+\s\+//'
}
alias bl.tools.unique="bl_tools_unique"
bl_tools_dependency_check_pkgconfig() {
    local __doc__='
    This function check if all given libraries can be found.

    #### Example:

    >>> bl.tools.dependency_check_shared_library libc.so; echo $?
    0
    >>> bl.tools.dependency_check_shared_library libc.so __not_existing__ 1>/dev/null; echo $?
    2
    >>> bl.tools.dependency_check_shared_library __not_existing__ 1>/dev/null; echo $?
    2
    '
    local return_code=0
    local library

    if ! bl.tools.dependency_check pkg-config &>/dev/null; then
        bl.logging.critical 'Missing dependency "pkg-config" to check for packages.'
        return 1
    fi
    for library in $@; do
        if ! pkg-config "$library" &>/dev/null; then
            return_code=2
            echo "$library"
        fi
    done
    return $return_code
}
alias bl.tools.dependency_check_pkgconfig=bl_tools_dependency_check_pkgconfig
bl_tools_dependency_check_shared_library() {
    local __doc__='
    This function check if all given shared libraries can be found.

    #### Example:

    >>> bl.tools.dependency_check_shared_library libc.so; echo $?
    0
    >>> bl.tools.dependency_check_shared_library libc.so __not_existing__ 1>/dev/null; echo $?
    2
    >>> bl.tools.dependency_check_shared_library __not_existing__ 1>/dev/null; echo $?
    2
    '
    local return_code=0
    local pattern

    if ! bl.tools.dependency_check ldconfig &>/dev/null; then
        bl.logging.critical 'Missing dependency "ldconfig" to check for shared libraries.'
        return 1
    fi
    for pattern in $@; do
        if ! ldconfig --print-cache | cut --fields 1 --delimiter ' ' | \
            grep "$pattern" &>/dev/null
        then
            return_code=2
            echo "$pattern"
        fi
    done
    return $return_code
}
alias bl.tools.dependency_check_shared_library=bl_tools_dependency_check_shared_library
bl_tools_dependency_check() {
    # shellcheck disable=SC2034
    local __doc__='
    This function check if all given dependencies are present.

    #### Example:

    >>> bl.tools.dependency_check mkdir ls; echo $?
    0
    >>> bl.tools.dependency_check mkdir __not_existing__ 1>/dev/null; echo $?
    2
    >>> bl.tools.dependency_check __not_existing__ 1>/dev/null; echo $?
    2
    >>> bl.tools.dependency_check "ls __not_existing__"; echo $?
    __not_existing__
    2
    '
    local return_code=0
    local dependency

    if ! hash &>/dev/null; then
        bl.logging.critical 'Missing dependency "hash" to check for available executables.'
        return 1
    fi
    for dependency in $@; do
        if ! hash "$dependency" &>/dev/null; then
            return_code=2
            echo "$dependency"
        fi
    done
    return $return_code
}
alias bl.tools.dependency_check=bl_tools_dependency_check
bl_tools__doctest_setup__='
lsblk() {
    if [[ "${@: -1}" == "" ]];then
        echo "lsblk: : not a block device"
        return 1
    fi
    if [[ "${@: -1}" != "/dev/sdb" ]];then
        echo "/dev/sda disk"
        echo "/dev/sda1 part SYSTEM_LABEL 0x7"
        echo "/dev/sda2 part"
    fi
    if [[ "${@: -1}" != "/dev/sda" ]];then
        echo "/dev/sdb disk"
        echo "/dev/sdb1 part boot_partition "
        echo "/dev/sdb2 part system_partition"
    fi
}
blkid() {
    [[ "${@: -1}" != "/dev/sda2" ]] && return 0
    echo "gpt"
    echo "only discoverable by blkid"
    echo "boot_partition"
    echo "192d8b9e"
}
'
bl_tools_find_block_device() {
    # shellcheck disable=SC2034,SC2016
    local __doc__='
    >>> bl.tools.find_block_device "boot_partition"
    /dev/sdb1
    >>> bl.tools.find_block_device "boot_partition" /dev/sda
    /dev/sda2
    >>> bl.tools.find_block_device "discoverable by blkid"
    /dev/sda2
    >>> bl.tools.find_block_device "_partition"
    /dev/sdb1 /dev/sdb2
    >>> bl.tools.find_block_device "not matching anything" || echo not found
    not found
    >>> bl.tools.find_block_device "" || echo not found
    not found
    '
    local partition_pattern="$1"
    local device="${2-}"

    [ "$partition_pattern" = "" ] && return 1
    find_block_device_simple() {
        local device_info
        lsblk --noheadings --list --paths --output \
        NAME,TYPE,LABEL,PARTLABEL,UUID,PARTUUID ${device:+"$device"} \
        | sort --unique | while read -r device_info; do
            local current_device
            current_device=$(echo "$device_info" | cut -d' ' -f1)
            if [[ "$device_info" = *"${partition_pattern}"* ]]; then
                echo "$current_device"
            fi
        done
    }
    find_block_device_deep() {
        local device_info
        lsblk --noheadings --list --paths --output NAME ${device:+"$device"} \
        | sort --unique | cut -d' ' -f1 | while read -r current_device; do
            blkid -p -o value "$current_device" \
            | while read -r device_info; do
                if [[ "$device_info" = *"${partition_pattern}"* ]]; then
                    echo "$current_device"
                fi
            done
        done
    }
    local candidates
    candidates=($(find_block_device_simple))
    [ ${#candidates[@]} -eq 0 ] && candidates=($(find_block_device_deep))
    unset -f find_block_device_simple
    unset -f find_block_device_deep
    [ ${#candidates[@]} -eq 0 ] && return 1
    [ ${#candidates[@]} -ne 1 ] && echo "${candidates[@]}" && return 1
    bl.logging.plain "${candidates[0]}"
}
alias bl.tools.find_block_device=bl_tools_find_block_device
bl_tools_create_partition_via_offset() {
    local device="$1"
    local nameOrUUID="$2"
    local loop_device
    loop_device="$(losetup --find)"
    local sector_size
    sector_size="$(blockdev --getbsz "$device")"

    # NOTE: partx's NAME field corresponds to partition labels
    local partitionInfo
    partitionInfo=$(partx --raw --noheadings --output \
        START,NAME,UUID,TYPE "$device" 2>/dev/null| grep "$nameOrUUID")
    local offsetSectors
    offsetSectors="$(echo "$partitionInfo"| cut --delimiter ' ' \
        --fields 1)"
    if [ -z "$offsetSectors" ]; then
        bl.logging.warn "Could not find partition with label/uuid \"$nameOrUUID\" on device \"$device\""
        return 1
    fi
    local offsetBytes
    offsetBytes="$(echo | awk -v x="$offsetSectors" -v y="$sector_size" '{print x * y}')"
    losetup --offset "$offsetBytes" "$loop_device" "$device"
    bl.logging.plain "$loop_device"
}
alias bl.tools.create_partition_via_offset=bl_tools_create_partition_via_offset
bl_tools_make_uefi_boot_entry() {
    local __doc__='
    Creates an uefi boot entry.

    >>> bl.tools.make_uefi_boot_entry archLinux
    ...
    >>> bl.tools.make_uefi_boot_entry archLinuxFallback
    ...
    >>> bl.tools.make_uefi_boot_entry archLinuxLTSFallback vmlinuz-linux-lts
    ...
    '
    local kernelParameterFilePath="${ILU_CONFIG_PATH}linux/kernel/${1}CommandLine"
    local kernel='vmlinuz-linux'
    if [[ "$2" ]]; then
        kernel="$2"
    fi
    if [[ -f "$kernelParameterFilePath" ]]; then
        local command="sudo efibootmgr --verbose --create --disk /dev/sda --part 1 -l \"\\${kernel}\" --label \"$1\" --unicode \"$(cat "$kernelParameterFilePath")\""
        echo "Create boot entry \"$1\" with command \"${command}\"."
        eval $command
    else
        echo "Error: file \"${kernelParameterFilePath}\" doesn't exists."
    fi
    return $?
}
alias bl.tools.make_uefi_boot_entry=bl_tools_make_uefi_boot_entry
bl_tools_ssh_screen() {
    local __doc__='
    Wraps the ssh client for automatically starting a screen session on
    server.
    >>> sshScreen user@host [SSH_OPTIONS]
    '
    ssh "$1" -t 'screen -r || screen -S main' "${@:2}"
    return $?
}
alias bl.tools.ssh_screen=bl_tools_ssh_screen
bl_tools_run_with_appended_shebang() {
    local __doc__='
    This function reads and returns the shebang from given file if exist.

    # /usr/bin/env python -O /path/to/script.py
    >>> appendShebang -O -- /path/to/script.py
    ...
    # /usr/bin/env python -O /path/to/script.py argument1 argument2
    >>> runWithAppendedShebang -O -- /path/to/script.py argument1 argument2
    ...
    '
    local shebangArguments=''
    local arguments=''
    local applicationPath=''
    local shebangArgumentsEnded=false
    while true; do
        case "$1" in
            --)
                shebangArgumentsEnded=true
                shift
                ;;
            '')
                shift
                break
                ;;
            *)
                if ! $shebangArgumentsEnded; then
                    shebangArguments+=" $(validateBashArgument "$1")"
                elif [[ ! "$applicationPath" ]]; then
                    applicationPath="$1"
                else
                    arguments+=" $(validateBashArgument "$1")"
                fi
                shift
                ;;
        esac
    done
    local applicationRunCommand="$(head --lines 1 "$applicationPath" | sed \
        --regexp-extended \
        's/^#!(.+)$/\1/g')${shebangArguments} ${applicationPath} $arguments"
    # NOTE: The following line could be useful for debugging scenarios.
    #echo "Run: \"$applicationRunCommand\""
    eval "$applicationRunCommand"
    return $?
}
alias bl.tools.run_with_appended_shebang=bl_tools_run_with_appended_shebang
overlayLocation() {
    # Mounts an overlay over given location. This could be useful if we have a
    # read only system caused by physical reasons.
    #
    # Examples:
    # >>> overlayLocation /usr/bin/
    mkdir --parents /tmp/overlayfsDifferences
    mount --types overlayfs --options \
        lowerdir="$1",upperdir='/tmp/overlayDifferences' overlayfs "$1"
    return $?
}
addDefaultUpstartService() {
    # Add a given start script to autostart and close scripts in an upstart
    # based system. Note that given script has to be located at "/etc/init.d/".
    #
    # Examples:
    #
    # addDefaultUpstartService script.sh
    # ...
    chmod +x "/etc/init/$1"
    update-rc.d "$1" defaults
    return $?
}
removeDefaultUpstartService() {
    # Remove a given start script to autostart and close scripts in an upstart
    # based system. Note that given script has to be located at "/etc/init.d/".
    #
    # Examples:
    #
    # removeDefaultUpstartService script.sh
    # ...
    update-rc.d -f "$1" remove
    return $?
}
calculatePercent() {
    # Calculates percent of second argument from the first argument.
    #
    # Examples:
    #
    # >>> calculatePercent 100 50
    # 50
    echo "$(((($2 * 10000) / $1) / 100)).$(sed --regexp-extended \
        's/^(.)$/0\1/g' <<<$(((($2 * 10000) / $1) % 100)))"
    return $?
}
prependVimModline() {
    # Prepend a vim modline to a text based file. Assumes that there exists a
    # function named "getVimModline" which prints appreciate modline for given
    # file path as first argument.
    #
    # Examples:
    #
    # >>> prependVimModline /path/text/file #
    local tempFile=$(mktemp)
    local firstNewLine=$(grep --extended-regexp '^$' "$1" --line-number | \
        head --lines 1 | grep --extended-regexp --only-matching '^[0-9]+')
    head --lines "$firstNewLine" "$1" 1>"$tempFile"
    getVimModline "$2" 1>>"$tempFile"
    echo '' 1>>"$tempFile"
    local numberOfLines=$(wc --lines "$1" | grep --extended-regexp \
        --only-matching '[0-9]+')
    let numberOfFooterLines="$numberOfLines - $firstNewLine"
    tail --lines "$numberOfFooterLines" "$1" 1>>"$tempFile"
    # NOTE: Only move the file content to preserve file attributes.
    cat "$tempFile" 1>"$1"
    return $?
}
appendVimModline() {
    # Append a vim modline to a text based file. Assumes that there exists a
    # function named "getVimModline" which prints appreciate modline for given
    # file path as first argument.
    #
    # Examples:
    #
    # >>> appendVimModline /path/text/file #
    echo '' 1>>"$1"
    getVimModline "$2" 1>>"$1"
    return $?
}
writeImageToBlockdevice() {
    # Writes a given image to given blockdevice.
    #
    # Examples:
    #
    # >>> writeImageToBlockdevice /data/private/backup/image.img /dev/mmcblk0
    local source="${ILU_DATA_PATH}temp/image/"*.img
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target=/dev/mmcblk0
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
writeBlockdeviceToImage() {
    # Writes a given backup from given blockdevice.
    #
    # Examples:
    #
    # >>> writeBlockdeviceToImage /dev/mmcblk0 /data/private/backup/image.img
    local source=/dev/mmcblk0
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target="${ILU_DATA_PATH}private/backup/backup-sd-card.img"
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
makeSingleExecutable() {
    # Creates a bsd and virtually posix shell compatible single executable file
    # from an application directory.
    #
    # Examples:
    #
    # >>> makeSingleExecutable /applicationDirectory startFile
    # ...
    if [[ ! "$1" ]]; then
        echo "Usage: $0 <DIRECTOTY_PATH> [EXECUTABLE_FILE_NAME] [RELATIVE_START_FILE_PATH]"
        exit 1
    fi
    local fileName='index.sh'
    if [[ "$2" ]]; then
        fileName="$2"
    fi
    local relativeStartFilePath='./index'
    if [[ "$3" ]]; then
        relativeStartFilePath="$3"
    fi
    local directoryName=$(basename $(readlink --canonicalize "$1"))
    # NOTE: short option is necessary for mac compatibility.
    cat << EOF 1>"$fileName"
#!/bin/bash
executableDirectory=\$(mktemp -d 2>/dev/null || mktemp -d -t '' 2>/dev/null)
dataOffset=\$((\$(grep --text --line-number '^exit \\\$?$' "\$0" | \\
    cut -d ':' -f 1) + 1))
tail -n +\$dataOffset "\$0" | tar -xzf - -C "\$executableDirectory" \\
    1>/dev/null && \\
"\${executableDirectory}/${directoryName}/${relativeStartFilePath}" "\$@"
exit \$?
EOF
    local tempArchiv=$(mktemp).tar.gz
    tar --create --verbose --gzip --posix --file "$tempArchiv" "$1" &&
    cat "$tempArchiv" 1>>"$fileName"
    chmod +x "$fileName"
    return $?
}
# region pacman
showNotMaintainedByPacmanSystemFiles() {
    # Shows all files which aren't maintained by pacman on currently running
    # system.
    #
    # Examples:
    #
    # >>> showNotMaintainedByPacmanSystemFiles
    # ...
    local allFiles=$(mktemp)
    local allMaintainedFiles=$(mktemp)

    sudo find / | sort | sed 's:/$::g' | sort | uniq 1>"$allFiles"
    pacman --query --list --quiet | sed 's:/$::g' | sort | \
        uniq 1>"$allMaintainedFiles"
    cat "$allFiles" "$allMaintainedFiles" | \
        sed 's:^/home/.*$::g' | \
        sed 's:^/root/.*$::g' | \
        sed 's:^/dev/.*$::g' | \
        sed 's:^/sys/.*$::g' | \
        sed 's:^/tmp/.*$::g' | \
        sed 's:^/run/.*$::g' | \
        sed 's:^/var/tmp/.*$::g' | \
        sed 's:^/var/cache/.*$::g' | \
        sed 's:^/var/log/.*$::g' | \
        sed 's:^/proc/.*$::g' | \
        sort | uniq --unique
    local numberOfAllFiles=$(wc --lines $allFiles | cut --delimiter ' ' --field 1)
    local numberOfMaintainedFiles=$(wc --lines $allMaintainedFiles | cut --delimiter ' ' --field 1)
    let numberOfNotMaintainedFiles="${numberOfAllFiles} - ${numberOfMaintainedFiles}"
    cat << EOF

Number of files: $numberOfAllFiles 100%
Number of maintained files: $numberOfMaintainedFiles $(calculatePercent $numberOfAllFiles $numberOfMaintainedFiles)%
Number of not maintained files: $numberOfNotMaintainedFiles $(calculatePercent $numberOfAllFiles $numberOfNotMaintainedFiles)%
EOF
    return $?
}
showConfigBackups() {
    # Shows all config backups created by pacman.
    #
    # Examples:
    #
    # >>> showConfigBackups
    # ...
    cd / 1>/dev/null
    for pattern in '*.pacnew' '*.orig' '*_backup*' '*.pacorig'; do
        sudo find -name "$pattern" -and \( -type f -or -type l -or -type d \)
    done
    cd - 1>/dev/null
    return $?
}
# endregion
sendEMail() {
    # Sends an email.
    #
    # Examples:
    #
    # >>> sendEMail subject content address
    # >>> sendEMail subject content address "Sun, 2 Feb 1986 14:23:56 +0100"
    local eMailAddress="$ILU_ALTERNATE_USER_EMAIL_ADDRESS"
    if [ "$3" ]; then
        eMailAddress="$3"
    fi
    local date="$(date)"
    if [ "$4" ]; then
        date="$4"
    fi
    msmtp -t <<EOF
From: $eMailAddress
To: $eMailAddress
Reply-To: $eMailAddress
Date: $date
Subject: $1

$2

EOF
    return $?
}
setMaxUserWatches() {
    # Sets the maximum number of concurrent allowed file observations via
    # inotify.
    #
    # Examples:
    #
    # >>> setMaxUserWatches 500000
    echo "$1" | sudo tee '/proc/sys/fs/inotify/max'_user_watches
    return $?
}
makeSSHKey() {
    # Generates a new ssh key.
    #
    # Examples:
    #
    # >>> makeSSHKey
    # ...
    # >>> makeSSHKey hans
    # ...
    local user="$ILU_USER_EMAIL_ADDRESS"
    if [ "$1" ]; then
        user="$1"
    fi
    ssh-keygen -t rsa -C "$user"
    return $?
}
makeOpenSSLPemFile() {
    # Creates a concatenated pem file needed for server with https support.
    #
    # Examples:
    #
    # >>> makeOpensslPemFile
    # ...
    local host='localhost'
    if [[ "$1" ]]; then
        host="$1"
    fi
    echo 'Create your private key without a password.'
    openssl genrsa -out "${host}.key" 1024
    echo 'Create a temporary csr file.'
    openssl req -new -key "${host}.key" -out "${host}.csr"
    echo 'Self-sign your certificate.'
    openssl x509 -req -days 365 -in "${host}.csr" -signkey "${host}.key" -out \
        "${host}.crt"
    echo 'Creating a pem file.'
    cat "${host}.key" "${host}.crt" 1>"${host}.pem"
    return $?
}
findHardlinks() {
    # Finds same files as given file (hardlinks).
    #
    # Examples:
    #
    # >>> findHardlinks /home/user/test.txt
    # ...
    sudo find / -samefile $1 2>/dev/null
    return $?
}
makeCryptBlockdevice() {
    # Creates encrypted blockdevices.
    #
    # Examples:
    #
    # >>> makeCryptBlockdevice /dev/sda
    sudo cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 \
        --iter-time 5000 --use-random luksFormat "$1"
}
openCryptBlockdevice() {
    # Mounts encrypted blockdevices as analyseable blockdevice.
    #
    # Examples:
    #
    # >>> openCryptBlockdevice /dev/sdb test
    sudo cryptsetup luksOpen "$1" "$2"
    return $?
}
closeCryptBlockdevice() {
    # Mounts encrypted blockdevices as analyseable blockdevice.
    #
    # Examples:
    #
    # >>> closeCryptBlockdevice test
    sudo cryptsetup luksClose "$1"
    return $?
}
bl_tools_open() {
    # Opens a given path with a useful program.
    #
    # Examples:
    #
    # >>> bl.tools.open http://www.google.de
    # >>> bl.tools.open file.text
    local program
    for program in gnome-open kde-open gvfs-open exo-open xdg-open gedit \
        mousepad gvim vim emacs nano vi less cat
    do
        if hash "$program" 2>/dev/null; then
            "$program" "$1"
            break
        fi
    done
    return $?
}
alias bl.tools.open='bl_tools_open'
showSymlinks() {
    # Shows symbolic links in current directory if no argument is provided or
    # in given location and their subdirectories (recursive).
    #
    # Examples:
    #
    # >>> showSymlinks
    # ./.vim -> ./configs/vimConfig
    # ...
    #
    # >>> showSymlinks /home
    # /home/user/.vim -> /home/user/configs/vimConfig
    # ...
    local fileSystemElement
    for fileSystemElement in $(find "$1" -type l); do
        echo "$fileSystemElement"' -> '
        readlink "$fileSystemElement"
    done
    return $?
}
runInProgramsLocation() {
    # Changes current working directory to given program path and runs the
    # program.
    #
    # Examples:
    #
    # >>> runInProgramsLocation /usr/bin/python3.2
    # ...
    if [ "$1" ] && [ -f "$1" ]; then
        cd "$(dirname "$1")"
        "./$(basename "$1")" $*
        return $?
    else
        echo 'Please insert a path to an executable file.'
        return $?
    fi
}
repairLinuxFilesystem() {
    # Finds filesystem errors on linux based filesystem and repairs them.
    #
    # Examples:
    #
    # >>> repairLinuxFilesystem /dev/mmcblk0p2
    # ...
    local target=/dev/mmcblk0
    if [[ "$1" ]]; then
        target="$1"
    fi
    sudo badblocks "$target"
    sudo fsck -a "$target"
    return $?
}
sshPrint() {
    # Prints a file via ssh. A given printable file will be sent to a given
    # location via scp. The file be stored in remotes home directory with given
    # name. After this procedure a remote print order will be sent.
    #
    # Examples:
    #
    # >>> sshPrint /home/hans/document.txt
    # ...
    # >>> sshPrint /home/hans/document.txt hans
    # ...
    # >>> sshPrint /home/hans/document.txt hans hp15
    # ...
    local user='sickertt'
    local host='login.informatik.uni-freiburg.de'
    local defaultPrinter='hp15'
    local usageMessage="Usage: "$0" <file> [login] [printer] [withFileContentPipe]"

    if [[ $# < 1 ]]; then
        echo "$usageMessage"
    # 1. argument: File, which we want to print.
    elif [ -f "$1" ]; then
        # 2. argument: Check for given user name.
        if [ "$2" ]; then
            local login="$2"@"$host"
        elif [ "$user" ]; then
            local login="$user"@"$host"
        else
            # Grab user from "~/.ssh/config".
            local userRow=$(cat ~/.ssh/config | grep "$host" -A1 | \
                grep -i user)
            if [ "$userRow" ]; then
                local user=$(echo ${userRow} | sed s/user\\s//ig)
                local login="$user"@"$host"
            else
                echo 'No login given.'
                echo "$usageMessage"
            fi
        fi
        # 3. argument: Select printer.
        local printer=defaultPrinter
        if [ "$3" ]; then
            local printer="$3"
        fi
        # 4. argument: Determines which way to use for transport file content.
        if [ "$4" ]; then
            echo 'Pipe file content through ssh.'
            cat "$1" | ssh "$login" lpr -P"$printer"
            return $?
        else
            echo "Copy file to server via scp ($login)."
            scp "$1" "${login}:/tmp/.sshPrint"
            ssh "$login" lpr -P"$printer" ~/.sshPrint
            return $?
        fi
    else
        echo "Given file doesn't exist."
        return $?
    fi
}
unpack() {
    # Unpack archives in various formats.
    #
    # Examples:
    #
    # >>> unpack path/to/archiv.zip
    if [ -f "$1" ]; then
        local command
        case "$1" in # switch
            *.tar.bz2|*.tbz2)
                command="tar --extract --verbose --bzip2 --file \"$1\""
                ;;
            *.tar.gz|*.tgz)
                command="tar --extract --verbose --gzip --file \"$1\""
                ;;
            *.bz2)
                command="bzip2 --decompress \"$1\""
                ;;
            *.rar)
                command="unrar x \"$1\""
                ;;
            *.gz)
                command="gzip --decompress \"$1\""
                ;;
            *.tar)
                command="tar --extract --verbose --file \"$1\""
                ;;
            *.zip)
                command="unzip -o \"$1\""
                ;;
            *.Z)
                command="compress -d \"$1\""
                ;;
            *.7z)
                7z x "$1"
                ;;
            *)
                echo  "Cannot extract \"$1\"."
                ;;
        esac
        if [ "$command" ]; then
            echo "Running: [$command]."
            eval "$command"
            return $?
        fi
    else
        echo "\"$1\" is not a valid file."
        return $?
    fi
}
pack() {
    # Packs archives.
    #
    # Examples:
    #
    # >>> pack archiv.zip /path/to/file.ext
    # >>> pack archiv.zip /path/to/directory
    if [ -d "$2" ] || [ -f "$2" ]; then
        local command
        case "$1" in
            *.tar.bz2|*.tbz2)
                command="tar --dereference --create --verbose --bzip2 --file \"$1\" \"$2\""
                ;;
            *.tar.gz|.*tgz)
                command="tar --dereference --create --verbose --gzip --file \"$1\" \"$2\""
                ;;
            *.bz2)
                command="bzip2 --stdout \"$2\" 1>\"$1\""
                ;;
            *.gz)
                if [ -d "$2" ]; then
                    command="gzip --recursive --stdout \"$2\" 1>\"$1\""
                else
                    command="gzip --stdout \"$2\" 1>\"$1\""
                fi
                ;;
            *.tar)
                command="tar --dereference --create --verbose --file \"$1\" \"$2\""
                ;;
            *.zip)
                if [ -d "$2" ]; then
                    command="zip --recurse-paths \"$1\" \"$2\""
                else
                    command="zip \"$1\" \"$2\""
                fi
                ;;
            *.Z)
                command="compress --stdout \"$2\" 1>\"$1\""
                ;;
            *.7z)
                command="7z a \"$1\" \"$2\""
                ;;
            *)
                echo "Cannot pack \"$1\"."
                return $?
        esac
        if [ "$command" ]; then
            echo "Running: [$command]."
            eval "$command"
            return $?
        fi
    else
        echo "\"$2\" is not a valid file or directory."
        return $?
    fi
}
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
