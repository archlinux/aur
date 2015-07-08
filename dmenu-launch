#!/bin/bash
### Dmenu Launcher ###############
# Version 0.5.7 by Scott Garrett #
# Wintervenom [(at)] gmail.com   #
##################################
# Depends on:  dmenu             #
#   Optional:  slmenu            #
##################################
# Changelog                      #
# 0.4.1   + Read DMENU_OPTIONS   #
#           for colors           #
# 0.5.0   + Clean-up code        #
#         + Cache XDG items to   #
#           speed up look-up     #
#         + Added Terminal       #
#           option.              #
# 0.5.1   + Fix '=' parse bug    #
# 0.5.2   + Launch history       #
#           added                #
# 0.5.3   + Clear History option #
#           added                #
# 0.5.4   + Don't try to source  #
#           config file if it is #
#           not yet created      #
# 0.5.5   + Use `slmenu` (if it  #
#           is installed) when   #
#           running from a non-  #
#           dumb terminal        #
# 0.5.6   + Added Detach option  #
#           in terminal mode     #
#         + Added Cache option:  #
#           generate menu for    #
#           the next run in the  #
#           background           #
#         + History optional     #
# 0.5.7   + Run in Terminal and  #
#           Detach options move  #
#           back to front for    #
#           convineince          #
#         + Bug fix:  display    #
#           rest of menu items   #
#           at first launch      #
# 0.5.8   + Change $* to "$@"    #
##################################


###############
### Globals ###
###############

# Path to XDG shortcut (*.desktop) directories.
xdg_paths=(
    /usr/share/applications
    /usr/local/share/applications
    ~/.local/share/applications
)

# Path to Dmenu Launcher configuration file.
config="$HOME/.config/dmenu-launch/config"

# Path to Dmenu Launcher cache will be stored.
cache="$HOME/.cache/dmenu-launch.cache"

# Path to history file.
hist="$HOME/.config/dmenu-launch/history"

# Dmenu command.
dm="dmenu -i $DMENU_OPTIONS"
if tty &> /dev/null && [[ "$TERM" != 'dumb' ]]; then
    if which 'slmenu' &> /dev/null; then
        dm='slmenu -i'
        term_mode=1
    fi
elif [[ -z "$DISPLAY" ]]; then
    exit 1
fi

# Choose proper LSX binary.
if which 'lsx-suckless' &> /dev/null; then
    lsx=lsx-suckless
else
    lsx=lsx
fi

# Run in Terminal flag.
flag_terminal='no'

# Show Binaries flag.
flag_binaries='yes'

# Show XDG Names flag.
flag_xdg_names='yes'

# Remember launch history.
flag_history='yes'

# Cache and re-use last generated menu.
flag_cache='yes'

# Terminal to use.
terminal='urxvt'

# Configuration items.
config_menu=('Clear History' 'Run in Terminal' 'Terminal' 'Detach'
             'Show Binaries' 'Show XDG Names' 'History' 'Cache')


#################
### Functions ###
#################

set_option () {
    value="$2"
    # If the caller wanted to flip a "yes" to a "no" or vise versa...
    if [[ "$3" == 'flip' ]]; then
        [[ "$3" == 'flip' && "$value" == 'yes' ]] && value='no' || value='yes'
    fi
    # Create configuration directory if it doesn't exist.
    mkdir -p "${config%/*}"
    touch "$config"
    # Remove the old setting.
    sed -i "s:^$1=.*::g" "$config"
    # Append the new setting.
    echo "$1=\"$value\"" >> "$config"
    # Reload the configuraton file so it takes effect.
    . "$config"
}

build_list () {
    # Create cache directory if it doesn't exist.
    mkdir -p "${cache%/*}"
    # Cache names and executable paths of XDG shortcuts.
    for file in $(printf '%s/*.desktop\n' "${xdg_paths[@]}"); do
        # Grab the friendly name and path of the executable.
        # (Thanks, <geirha@freenode/#awk>.)
        awk -F'=' '$1 == "Name" {sub(/Name=/, "", $0); name=$0}
                   $1 == "Exec" {sub(/Exec=/, "", $0); exec=$0}
                   END { print name "|" exec }' "$file" 2> /dev/null
    done > "$cache"
    # Start printing out the menu items, starting with XDG shortcut names...
    sed 's/|.*$//' "$cache" | sort -u
    # ...then, the binary names...
    (IFS=':'; $lsx $PATH | sort -u)
}

cache_menu () {
    build_list > "${cache}-menu.new"
    mv "${cache}-menu"{.new,}
}

build_menu () {
    if [[ "$flag_detach" == 'yes' ]]; then
        echo "[${config_menu[1]}: $flag_terminal]"
        echo "[${config_menu[2]}: $terminal]"
    fi
    [[ "$term_mode" ]] &&
        echo "[${config_menu[3]}: $flag_detach]"
    if [[ "$flag_cache" == 'yes' ]]; then
        [[ ! -f "${cache}-menu" ]] &&
            cache_menu
        cat "${cache}-menu"
    else
        build_list
    fi
    # ...then, the configuration options.
    echo "[${config_menu[7]}: $flag_cache]"
    echo "[${config_menu[6]}: $flag_history]"
    echo "[${config_menu[5]}: $flag_xdg_names]"
    echo "[${config_menu[4]}: $flag_binaries]"
    [[ "$flag_history" == 'yes' ]] &&
        echo "[${config_menu[0]}]"
}

update_history () {
    (echo "$1"; head -9 "$hist" | grep -Fvx "$1") > "$hist.new"
    mv "$hist"{.new,}
}

build_hist_menu () {
    mkdir -p "${hist%/*}"
    touch "$hist"
    menu_items=$(build_menu)
    hist_items=$(grep -Fx "$(echo "$menu_items")" "$hist")
    echo "$hist_items" > "$hist" # Keep the history file free of invalids.

    # There's probably a better way, but this works, for now.
    if [[ ${#hist_items} > 1 ]]; then
        echo "$hist_items"
        echo "$menu_items" | grep -Fvx "$hist_items"
    else
        echo "$menu_items"
    fi
}

program_exists () {
    which "$1" &> /dev/null
}

launch () {
    if [[ "$flag_detach" == 'yes' ]]; then
        # Shouldn't be set when there won't be a terminal attached anymore...
        export TERM='dumb'
        # ...and won't be interactive...
        unset PS1
        "$@" </dev/null &>/dev/null & disown
    else
        "$@"
    fi
}



############
### Main ###
############

# So caching can be done in the background without locking the script up.
if [[ "$1" == 'cache' ]]; then
    cache_menu
    exit
fi

# Load configuration
[[ -f "$config" ]] && . "$config"

# Launch processes in background, detached and disowned from shell.
[[ "$term_mode" ]] && flag_detach='no' || flag_detach='yes'

while :; do
    # Ask the user to select a program to launch.
    if [[ "$flag_history" == 'yes' ]]; then
        app=$(build_hist_menu | $dm -p 'Execute:')
    else
        app=$(build_menu | $dm -p 'Execute:')
    fi
    [[ -z "$term_mode" ]] && flag_detach='yes'
    [[ "$flag_detach" == 'no' ]] && flag_terminal='no'
    case "$app" in
        *"[${config_menu[0]}"*)
            confirm=$(printf '%s\n' '[Yes]' '[No]' | $dm -p 'Clear history?')
            [[ -z "$confirm" || "$confirm" == '[No]' ]] && continue
            rm -f "$hist"
            touch "$hist"
            ;;
        *"[${config_menu[1]}"*)
            set_option flag_terminal $flag_terminal flip
            echo yes
            ;;
        *"[${config_menu[2]}"*)
            new_value=$(echo '[Cancel]' | $dm -p 'Set terminal:')
            [[ -z "$new_value" || "$new_value" == '[Cancel]' ]] && continue
            if ! which "$new_value"; then
                echo '[OK]' | $dm -p 'No such binary.'
                continue
            fi
            set_option terminal "$new_value"
            ;;
        *"[${config_menu[3]}"*)
            set_option flag_detach $flag_detach flip
            ;;
        *"[${config_menu[4]}"*)
            set_option flag_binaries $flag_binaries flip
            ;;
        *"[${config_menu[5]}"*)
            set_option flag_xdg_names $flag_xdg_names flip
            ;;
        *"[${config_menu[6]}"*)
            set_option flag_history $flag_history flip
            ;;
        *"[${config_menu[7]}"*)
            set_option flag_cache $flag_cache flip
            [[ -f "${cache}-menu" ]] && rm -f "${cache}-menu"
            ;;
        *)
            # Cache in the background.
            if [[ "$flag_cache" == 'yes' ]]; then
                $0 cache &
            fi
            # Quit if nothing was selected.
            [[ -z "$app" ]] && exit
            selection=$app
            # If the selection doesn't exist, see if it's an XDG shortcut.
            if ! program_exists $app; then
                app=$(grep -F "$app|" "$cache" | sed 's/.*|//;s/ %.//g')
                # If there's more than one, ask which binary to use.
                [[ "$(echo "$app" | wc -l)" != '1' ]] &&
                    app=$(echo "$app" | $dm -p 'Which one?')
                [[ -z "$app" ]] && exit
            fi

            # Check and see if the binary exists, and launch it, if so.
            if program_exists $app; then
                update_history "$selection"
                [[ $flag_terminal = 'no' ]] &&
                    launch $app ||
                    launch $terminal -e $app
                exit
            else
                echo '[OK]' | $dm -p 'No such binary.'
            fi
            ;;
    esac

done
