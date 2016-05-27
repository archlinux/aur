#!/bin/busybox sh

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# user root login shell program:
# * expects invocation as default shell ~/.profile
# * implements password query/reply:
#   https://www.freedesktop.org/wiki/Software/systemd/PasswordAgents/
#   https://www.freedesktop.org/software/systemd/man/systemd-ask-password.html

# verify if shell started form systemd unit
is_entry_service() { 
    [ "$script_entry" = "service" ]
}

# verify if shell started form tty or ssh
is_entry_console() { 
    [ "$script_entry" = "console" ]
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
    $systemd_ctl list-jobs | grep -i -q 'cryptsetup'
}

# verify if any files on the list are still present
has_any_file() {
    local file_list="$1" file=
    for file in $file_list ; do
        [ -e "$file" ] && return 0
    done
    return 1
}

# log output to console and journal
log_log() {
    local mode="$1" text="$2" session=
    [[ "$script_verbose" == *"info"* ]] && [[ "$mode" == *"info"* ]] && echo "$text"
    [[ "$script_verbose" == *"warn"* ]] && [[ "$mode" == *"warn"* ]] && echo "$text"
    [[ "$script_verbose" == *"err"*  ]] && [[ "$mode" == *"err"*  ]] && echo "$text"
    if is_ssh_connect ; then session="ssh" ; else session="loc" ; fi
    text="$script_entry/$session $text"
    echo "$text" | $systemd_cat --priority="$mode" --identifier="shell"
}

log_info() {
    local code="$?" text="$1" ; log_log "info"     "info : $text [$code]" 
}

log_warn() {
    local code="$?" text="$1" ; log_log "warning"  "warn : $text [$code]" 
}

log_error() {
    local code="$?" text="$1" ; log_log "err"      "error: $text [$code]" 
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

# read a portion of latest console output
read_console() {
    tail -c 256 "/dev/vcs"
}

# remove any pending content from the console input 
flush_stdin() { 
    read -r -s -n 10000000 -t 1
}

# ensure console is no longer changing
await_console() {
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

# ensure pending crypto jobs posted questions (ask files are present) 
await_request() {
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

# ensure crypto jobs removed questions (after message receipt) 
await_received() {
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

# ensure crypt jobs are gone (secret was correct)
await_validated() {
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

# query password from the console
run_query() {
    $systemd_query --timeout=$query_timeout "$query_prompt"
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

print_eol() {
   printf "\n"
}

# crypto secret default logic: implement custom password agent
do_crypt() {
    local config_list= socket_list= secret= socket= count=1
    while true ; do
        log_info "custom agent try #$count" ; let count+=1
        await_request || { log_warn "missing request" ; return 0 ; }
        await_console || { log_warn "volatile console" ; }
        flush_stdin
        config_list=$(list_ask_config)
        socket_list=$(list_ask_socket $config_list)
        secret=$(run_query) || { log_error "query failure" ; return 1 ; }
        for socket in $socket_list ; do
            [ ! -f "$socket" ] || { log_warn "socket removed" ; continue ; }
            run_reply "$secret" "$socket" || { log_error "reply failure" ; return 1 ; }
        done
        await_received "$socket_list" || { log_error "receipt failure" ; return 1 ; }
        await_validated || { log_warn "invalid secret" ; continue ; }
        return 0
    done
}

# crypto secret fall back logic: utilize standard password agent
do_agent() {
    log_info "system agent hand over"
    $systemd_agent
}

# exit this script
do_exit() {
    local code="$1" ; [ "$code" = "" ] && code=0  
    log_info "exit code=$code"
    sleep 1 # FIXME journal flush
    exit "$code"
}

# invoke sub shell
do_shell() {
    log_info "run sub shell"
    PS1="$script_prompt" /bin/sh
}

# change systemd state
do_reboot() { 
    log_info "do reboot"
    $systemd_ctl reboot 
}

# process invocation from tty console or ssh connection
entry_console() {
    if is_debug_shell ; then
        log_info "debug shell"
        return 0
    elif is_tool_shell ; then
        log_info "tool shell"
        return 0
    elif has_crypt_jobs ; then
        log_info "crypt jobs"
        do_crypt || do_agent
    else 
        log_info "prompt user"
        do_prompt
    fi
}

# process invocation from systemd unit initrd-cryptsetup.service
entry_service() {
    if has_crypt_jobs ; then
        log_info "crypt jobs" 
        if do_crypt || do_agent ; then
            log_info "crypt success" 
            do_exit 0
        else
            log_warn "crypt failure" 
            do_exit 1
        fi
    else
        log_info "nothing to do" 
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
    print_eol
    if is_entry_service ; then
        log_info "interrupt service"
        do_exit 1
    elif is_ssh_connect ; then
        log_info "interrupt console"
        do_prompt
    else
        log_info "interrupt"
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
    do_exit 0
}

# systemd service unit can override these arguments via [name=value]
setup_defaults() {
    # script behaviour
    [ -z "$script_entry" ]  && readonly script_entry="console"
    [ -z "$script_prompt" ]  && readonly script_prompt="=> "
    [ -z "$script_verbose" ]  && readonly script_verbose="error" # { info,warn,error }
        
    # password query settings
    [ -z "$query_prompt" ]  && readonly query_prompt=" secret>"
    [ -z "$query_timeout" ] && readonly query_timeout=0 # A timeout of 0 waits indefinitely.
            
    # active operation timeout
    [ -z "$sleep_delay" ] && readonly sleep_delay=0.5
    [ -z "$sleep_count" ] && readonly sleep_count=10
        
    # password inotify watch folder
    [ -z "$watch_folder"] && readonly watch_folder="/run/systemd/ask-password"
    
    # required systemd binaries
    [ -z "$systemd_cat"] && readonly systemd_cat="/usr/bin/systemd-cat"
    [ -z "$systemd_ctl"] && readonly systemd_ctl="/usr/bin/systemctl"
        
    # optional systemd binaries for cryptsetup
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
    log_info "init"
    mkdir -p "$watch_folder" || log_error "can not make $watch_folder"
    case "$script_entry" in
        # development
        exit)     do_exit ;;
        crypt)    do_crypt ;;
        shell)    do_shell ;;
        reboot)   do_reboot ;;
        prompt)   do_prompt ;;
        # production
        service)  entry_service ;;
        console)  entry_console ;;
              *)  log_error "program error" ;;
        esac       
}

# shell entry point
program() {
    readonly "$@"
    setup_defaults
    setup_interrupts
    process_invocation
}

program "$@"
