#!/bin/busybox sh

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# user root login shell program

# implements password query/reply
# https://www.freedesktop.org/wiki/Software/systemd/PasswordAgents/
# https://www.freedesktop.org/software/systemd/man/systemd-ask-password.html

# ask file format in /run/systemd/ask-password/ask.xxxxxx:
#[Ask]
#PID=179
#Socket=/run/systemd/ask-password/sck.41815b63f6e61f4c
#AcceptCached=1
#Echo=0
#NotAfter=0
#Message=Please enter passphrase for disk VBOX_HARDDISK (swap)!
#Icon=drive-harddisk
#Id=cryptsetup:/dev/block/8:2

# verify if shell started form systemd unit
is_entry_service() { 
    [ "$entry" ="service" ]
}

# verify if this is a remote session
is_ssh_connect() {
    [ -n "$SSH_CONNECTION" ]
}

# verify if given process is alive
is_pid_present() {
    ps | grep -E -e "[ ]+${1}[ ]+.*"
}

# verify if there are any crypto requests
is_ask_pending() {
    [ -n "$(list_ask_config)" ]
}

# verify if any crypttab jobs are in the queue
has_crypt_jobs() {
    $systemd_syctl list-jobs | grep -i -q 'cryptsetup'
}

# list current crypto question files
list_ask_config() {
    grep -i -l 'cryptsetup' $watch_folder/ask.* 2>/dev/null
}

# list current crypto socket files
list_ask_socket() {
    local config_list="$1" config=
    for config in $config_list ; do
        echo $(cat "$config" | grep -i 'socket=' | sed -e 's/socket=//I')
    done
}

# query password from the console
run_query() {
    $systemd_query --timeout=$user_timeout "$user_prompt"
}

# reply password to the requester
run_reply() {
    local secret="$1" socket="$2"
    echo "$secret" | $systemd_reply "1" "$socket"
}

# ask user for password once and answer to all requests
run_answer() {
    local socket_list="$1" socket= 
    local secret=$(run_query)
    for socket in $socket_list ; do
        run_reply "$secret" "$socket"
    done
}

# verify if any files on the list are still present
has_any_file() {
    local file_list="$1" file=
    for file in $file_list ; do
        [ -e "$file" ] && return 0
    done
    return 1
}

# await for requesters to remove their questions
wait_confirm() {
    local socket_list="$1"
    while  has_any_file "$socket_list" ; do
        sleep "$sleep_delay"
        let count+=1
        if [ "$count" -gt "$sleep_count" ] ; then
            return 1
        fi
    done
    return 0
}

# read a portion of latest console output
read_console() {
    tail -c 1024 "/dev/vcs"
}

# ensure console is no longer changing
wait_console() {
    local count=1 text1= text2=
    while true ; do
        text1=$(read_console)
        sleep "$sleep_delay"
        text2=$(read_console)
        if [ "$text1" = "$text2" ] ; then
            return 0
        fi
        let count+=1
        if [ "$count" -gt "$sleep_count" ] ; then
            return 1
        fi
    done
}

# ensure pending crypto jobs asked their requests 
wait_request() {
    local count=1
    while ! is_ask_pending ; do
        sleep "$sleep_delay"
        let count+=1
        if [ "$count" -gt "$sleep_count" ] ; then
            return 1
        fi
    done
    return 0
}

# crypto secret default logic
do_crypt() {

    wait_request

    wait_console

    local config_list= socket_list=

    # verify crypt requests are pending

    config_list=$(list_ask_config)
    socket_list=$(list_ask_socket "$config_list")
        
    if [ "" = "$socket_list" ] ; then
        echo "error: do_crypt with no requests"
        return 1
    fi
        
    run_answer "$socket_list"
    
    wait_confirm "$socket_list"

    # verify no new crypt requests are pending

    config_list=$(list_ask_config)
    socket_list=$(list_ask_socket "$config_list")

    if has_any_file "$socket_list" ; then
        echo "error: do_crypt failure to respond"
        return 1
    fi
    
    return 0

}

# crypto secret fall back logic
do_agent() {
    $systemd_agent
}

# exit shell script
do_exit() { 
    exit "$1"
}

# change systemd state
do_reboot() { 
    $systemd_syctl reboot 
}

# process invocation from tty console or ssh connection
do_console() {
    if has_crypt_jobs ; then
        do_crypt || do_agent 
    else 
        do_prompt
    fi
}

# process invocation from systemd service unit
do_service() {
    if has_crypt_jobs ; then
        do_crypt || do_agent
    else
        do_exit
    fi
}

# interactive shell menu
do_prompt() {
    local choice=
    while true ; do
        echo
        echo "select:"
        echo "c) crypto secret"
        echo "s) sys shell"
        echo "r) reboot"
        read -p ">>>" choice
        case "$choice" in
        c) do_crypt ;;
        s) do_exit ;;
        r) do_reboot ;;
        *) echo "$choice ?" ;;
        esac
    done
}

# respond to interrupt
do_trap() {
    if is_ssh_connect ; then
        do_prompt
    elif is_entry_service ; then
        do_exit 1
    else
        do_exit 0
    fi
}

# handle "CTRL-C"
trap_SIGINT () { 
    do_trap 
}

# handle "CTRL-D"
trap_SIGQUIT() { 
    do_trap
}

# handle termination
trap_SIGTERM() { 
    exit 0
}

# systemd service unit can provide these shell arguments
setup_defaults() {
    # user request settings
    [ -z "$user_prompt" ]  && readonly user_prompt="secret>"
    [ -z "$user_timeout" ] && readonly user_timeout=0 # A timeout of 0 waits indefinitely.
            
    # active operation timeout settings
    [ -z "$sleep_delay" ] && readonly sleep_delay=0.7
    [ -z "$sleep_count" ] && readonly sleep_count=10
        
    # password inotify watch folder
    [ -z "$watch_folder"] && readonly watch_folder="/run/systemd/ask-password"
    mkdir -p "$watch_folder"
    
    # required systemd binaries
    [ -z "$systemd_syctl"] && readonly systemd_syctl="/usr/bin/systemctl"
    [ -z "$systemd_query"] && readonly systemd_query="/usr/bin/systemd-ask-password"
    [ -z "$systemd_reply"] && readonly systemd_reply="/usr/lib/systemd/systemd-reply-password"
    [ -z "$systemd_agent"] && readonly systemd_agent="/usr/bin/systemd-tty-ask-password-agent"
}

setup_interrupts() {
    trap trap_SIGINT SIGINT
    trap trap_SIGQUIT SIGQUIT
    #trap trap_SIGTERM SIGTERM
}

# respond depending on script invocation type
process_invocation() {
    case "$entry" in
        # development invocations
        exit)     do_exit ;;
        crypt)    do_crypt ;;
        reboot)   do_reboot ;;
        prompt)   do_prompt ;;
        # production invocations
        service)  do_service ;;
              *)  do_console ;;
    esac       
}

# shell entry point
program() {
    
    readonly "$@" # inject arguments
    
    setup_defaults
    
    setup_interrupts
    
    process_invocation
                        
}

program "$@"
