#!/bin/busybox sh

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# user root login shell program:
# * expects invocation as default shell ~/.profile
# * implements password query/reply:
#   https://www.freedesktop.org/wiki/Software/systemd/PasswordAgents/
#   https://www.freedesktop.org/software/systemd/man/systemd-ask-password.html

# verify if shell started form systemd unit
is_entry_service() { 
    [ "$entry" = "service" ]
}

# verify if shell started form console debug shell
is_debug_shell() {
    ! is_entry_service && ! is_ssh_connect
}

# verify if shell started form some debug tool
is_tool_shell() {
    [ -n "$MC_SID" ]
}

# verify if shell is in interactive mode
is_interactive_shell() {
    [[ $- == *i* ]]
}

# verify if this is a remote session shell
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

# verify if any files on the list are still present
has_any_file() {
    local file_list="$1" file=
    for file in $file_list ; do
        [ -e "$file" ] && return 0
    done
    return 1
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
    local socket_list="$1" socket= secret= 
    secret=$(run_query) || return 1
    for socket in $socket_list ; do
        run_reply "$secret" "$socket" || return 2
    done
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

# ensure crypt jobs are gone
wait_complete() {
    local count=1
    while has_crypt_jobs ; do
        sleep "$sleep_delay"
        let count+=1
        if [ "$count" -gt "$sleep_count" ] ; then
            return 1
        fi
    done
    return 0
}

do_error() {
    local code="$?"
    local text="$1"
    echo "   error: $text code=$code"
}

# crypto secret default logic: all at once
do_crypt() {
    local config_list= socket_list=
    wait_request                 || { do_error "missing requests" ; return 1; }
    wait_console                 || { do_error "console is active" ; return 1; }
    config_list=$(list_ask_config)
    socket_list=$(list_ask_socket $config_list)
    run_answer "$socket_list"    || { do_error "query/reply failure" ; return 1; }
    wait_confirm "$socket_list"  || { do_error "requests still present" ; return 1; }
    wait_complete                || { do_error "new requests are posted" ; return 1; }
}

# crypto secret fall back logic: one at a time
do_agent() {
    $systemd_agent
}

# exit this script
do_exit() {
    local code="$1" ; [ "$code" = "" ] && code=0  
    exit "$code"
}

# invoke sub shell
do_shell() {
    PS1='-> ' /bin/sh
}

# change systemd state
do_reboot() { 
    $systemd_syctl reboot 
}

# process invocation from tty console or ssh connection
entry_console() {
    if is_debug_shell ; then
        return 0
    elif is_tool_shell ; then
        return 0
    elif has_crypt_jobs ; then
        do_crypt || do_agent 
    else 
        do_prompt
    fi
}

# process invocation from systemd unit initrd-cryptsetup.service
entry_service() {
    if has_crypt_jobs ; then
        if do_crypt || do_agent ; then
            do_exit 0
        else
            do_exit 1 # restart service
        fi
    else
        do_exit 0
    fi
}

# interactive user menu
do_prompt() {
    local choice=
    while true ; do
        echo
        echo "select:"
        echo "c) crypto secret"
        echo "s) sys shell"
        echo "r) reboot"
        echo "q) quit"
        read -p ">>>" choice
        case "$choice" in
        c) do_crypt ;;
        s) do_shell ;;
        r) do_reboot ;;
        q) do_exit 0 ;;
        *) echo "$choice ?" ;;
        esac
    done
}

# respond to interrupt
do_trap() {
    if is_entry_service ; then
        echo ""
        do_exit 1 # restart service
    elif is_ssh_connect ; then
        echo ""
        do_prompt # drop to menu
    else
        echo ""
        do_exit 0 # testing
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

# systemd service unit can override these arguments via [name=value]
setup_defaults() {
    # user request settings
    [ -z "$user_prompt" ]  && readonly user_prompt=" secret>"
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
    #trap trap_SIGQUIT SIGQUIT
    #trap trap_SIGTERM SIGTERM
}

# respond depending on script invocation type [entry=xxx]
process_invocation() {
    case "$entry" in
        # development invocations
        exit)     do_exit ;;
        crypt)    do_crypt ;;
        shell)    do_shell ;;
        reboot)   do_reboot ;;
        prompt)   do_prompt ;;
        # production invocations
        service)  entry_service ;;
              *)  entry_console ;;
    esac       
}

# shell entry point
program() {
    
    # arguments
    readonly "$@"
    
    setup_defaults
    
    setup_interrupts
    
    process_invocation
                        
}

program "$@"
