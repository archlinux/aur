#!/bin/bash

# Ryzen Power Profile Daemon

# Read defaults.
readonly CONF_DEF=/usr/share/ryzen-ppd/defaults
. "$CONF_DEF" || { echo "error reading the defaults configuration file $CONF_DEF"; exit 1; }

# Shows a description of the script usage.
show_usage() {
    cat << EOF
Ryzen Power Profile Daemon, version $VERSION
Description:
    Continously sets power settings for AMD Ryzen processors by using ryzenadj.
    A set of profiles can be configured in $CONF_USR.
    Profiles can be switched by writing to the named pipe $PIPE.
Usage:
    $0 [option]
Options:
    --help|-h
Examples:
    Switching to the 'performance' profile:
      echo 'performance' | tee $PIPE
EOF
}

# Parses command line options.
parse_args() {
    while [ $# -gt 0 ]; do
        case "$1" in
            --help|-h)
                show_usage; exit 0 ;;
            *)
                echo 'unknown option'; exit 1 ;;
        esac
        shift
    done
}

# Checks root privileges.
check_root() {
    [ "$(id -u)" -eq 0 ] || { echo 'root privileges required'; exit 1; }
}

# Reads defaults and user settings from configuration files.
parse_config() {
    . "$CONF_USR" || { echo "error reading the user configuration file $CONF_USR"; exit 1; }

    # Require the BALANCED and LOW_POWER profiles to be declared and non-empty
    [ -z "$BALANCED" ] || [ -z "$LOW_POWER" ] && { echo 'configure BALANCED and LOW_POWER profiles first'; exit 1; }
    # Check profile contents
    for limit in "${BATTERY[@]}" "${LOW_POWER[@]}" "${BALANCED[@]}" "${PERFORMANCE[@]}" "${CUSTOM[@]}"; do
        if ! [[ $limit =~ ^[0-9]+$ ]]; then
            echo "invalid limit $limit"; exit 1
        fi
    done
    # Check ryzenadj filepath
    [ ! -f "$RYZENADJ" ] && { echo "ryzenadj not found $RYZENADJ"; exit 1; }
}

# Creates a named pipe to receive profile changes during runtime.
create_pipe() {
    if [ -p "$PIPE" ]; then
        rm "$PIPE" || { echo "error removing named pipe $PIPE"; exit 1; }
    fi
    mkfifo -m "$PIPE_MODE" "$PIPE" || { echo "error creating named pipe $PIPE"; exit 1; }
}

# Gets the current profile according to the given setting.
# $1: profile setting
get_profile() {
    local tmp
    case "$1" in
       battery)     tmp=("${BATTERY[@]}")     ;;
       low-power)   tmp=("${LOW_POWER[@]}")   ;;
       balanced)    tmp=("${BALANCED[@]}")    ;;
       performance) tmp=("${PERFORMANCE[@]}") ;;
       custom)      tmp=("${CUSTOM[@]}")      ;;
    esac
    [ -z "$tmp" ] && { echo "profile $1 is not defined"; return; }
    echo "changing profile to $1"
    p=("${tmp[@]}")
    shift
}

# Gets the default profile depending on AC presence.
get_default_profile() {
    if [ "$(</sys/class/power_supply/AC/online)" -eq 1 ]; then
        get_profile "$PROFILE_AC"
    else
        get_profile "$PROFILE_BAT"
    fi
}

# Reads the named pipe and gets the matching profile.
read_pipe() {
    read -r -t "$UPDATE_RATE_S" <>"$PIPE" line && get_profile "$line"
}

# Sets the current profile with ryzenadj.
set_profile() {
    "$RYZENADJ" --stapm-limit="${p[0]}" --fast-limit="${p[1]}" --slow-limit="${p[2]}" --apu-slow-limit="${p[3]}" --tctl-temp="${p[4]}" --apu-skin-temp="${p[5]}" &>/dev/null
}

# Main
parse_args "$@"
check_root
parse_config
create_pipe
get_default_profile
while true; do
    set_profile
    read_pipe
done
