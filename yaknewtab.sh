#!/usr/bin/env bash
# =============================================================================
# Title:                    yaknewtab
# Description:              POSIX shell script to open new tabs/sessions in
#                           KDE terminal emulator Yakuake via D-Bus
# Author:                   Peter J. Mello
# Date:                     2025-09-20
# Version:                  1.0
# Usage:                    yaknewtab [options] [arguments]
# Bash Version:             5.3.3
# SPDX-License-Identifier:  GPL-3.0-or-later
# =============================================================================
# yaknewtab - A POSIX shell script to create new Yakuake tabs (a.k.a. sessions)
#
# Copyright © 2010-2018 Jesús Torres <jmtorres@ull.es>,
#           © 2019 Peter J. Mello <admin@petermello.net>,
#           © 2025 ArjixWasTaken <me@arjix.dev>.
#
# This program is free software: you can redistribute it and/or modify it under
#     the terms of the GNU General Public License as published by the Free
#     Software Foundation, either version 3 of the License, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful, but 
#     WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
#     Public License for more details.
#
#     You should have received a copy of the GNU General Public License along
#     with this program. If not, see <https://www.gnu.org/licenses/>.
# =============================================================================

### Utility functions
# A few utility functions to show errors, handle programa exit and more

PROGRAM_NAME="$(basename "$0")"
DEBUG=

# Show information about how to use this program
show_help() {
  cat <<-"EOF"

    Usage: "$PROGRAM_NAME" [options] [args]

      Options:
          -q                      Keep the Yakuake window hidden
          -e <cmd>                Command(s) to execute; this flag will catch all subsequent arguments, so must be called last
          -t <title>              Set <title> as the title of the new tab
          -p <property=value>     Change the value of a profile property (only for KDE 4)
          -h, --homedir           Open a new tab with '$HOME' as the working directory
          -w, --workdir <dir>     Open a new tab with <dir> as the working directory
          --hold, --noclose       Do not close the session automatically when the command ends
          --debug                 Redirect script debugging output to the console
          --help                  Print this message

      Arguments:
          args                    Arguments passed to command from '-e' flag
EOF
}

# Functions to show error and warning messages
error_exit() {
    echo "$PROGRAM_NAME: error: ${2:-'unkshown error'}" 1>&2
    exit "${1:-1}"
}

warning() {
    echo "$PROGRAM_NAME: warning: ${1:-'unkshown error'}" 1>&2
}

debug() {
    if [ -n "$DEBUG" ]; then
        echo "$PROGRAM_NAME: debug: ${1:-$(cat)}" 1>&2
    fi
}

### Profile setup
# Functions to handle terminal profile properties and setup
# them in the new session.

profile_properties=''

add_profile_setting() {
  if [ -z "$profile_properties" ]; then
    profile_properties="$1"
  else
    profile_properties="$profile_properties;$1"
  fi
}

profile_setup_command() {
  command -v konsoleprofile &>/dev/null || echo 'true'
  if [ -n "$profile_properties" ]; then
    echo "konsoleprofile '$profile_properties'"
  else
    echo 'true'
  fi
}

### Yakuake IPC
# Functions to make it easy to invoke some Yakuake methods

detect_dbus_cmd() {
  if command -v qdbus6 &>/dev/null; then
    echo qdbus6
    return
  fi
}

# Detect which IPC technology we have to use to talk to Yakuake
detect_ipc_interface() {
  if command -v "$dbus_cmd" &>/dev/null && "$dbus_cmd" "org.kde.yakuake" 2>/dev/null | grep -q MainApplication; then
    echo dbus
    return
  fi

  echo none
}

# Initialize IPC interface to Yakuake
init_ipc_interface() {
  local dbus_cmd="$1"

  local comm="$(detect_ipc_interface)"
  debug "Detected IPC interface: $comm"

  if [[ "$comm" = "none" ]]; then
    # Maybe Yakuake is not running. Launch the program and try it again
    command -v yakuake &>/dev/null || error_exit 20 "Yakuake is not installed"
    yakuake &>/dev/null || error_exit 126 "Yakuake can not be executed: exit with status $?"
    comm=$(detect_ipc_interface)
  elif [[ "$comm" = "dbus" ]]; then
    yakuake_addsession() {
      local session=$("$dbus_cmd" org.kde.yakuake /yakuake/sessions addSession)
      debug "addsession(): $session"
      echo "$session"
    }

    yakuake_runcommand() {
        local session="$1"
        local command="$2"

        "$dbus_cmd" org.kde.yakuake /yakuake/sessions org.kde.yakuake.runCommandInTerminal "$session" "$command" >/dev/null
    }

    yakuake_settitle() {
      local id="$1"
      local title="$2"

      "$dbus_cmd" org.kde.yakuake /yakuake/tabs setTabTitle "$id" "$title"
    }

    yakuake_showwindow() {
      "$dbus_cmd" org.kde.yakuake /yakuake/window toggleWindowState >/dev/null
    }

  else
    error_exit 22 "cannot connect to Yakuake"
  fi
}

### Main function

main() {
  local cwd="$PWD"
  local title=''
  local cmd=''
  
  local -i hold=0
  local -i show=1

  # Parse command line options
  local option=''
  local -i OPTIND=1
  local OPTARG=''

  while getopts ":-:t:p:w:he:q" option; do
    case $option in
      -)
        case "$OPTARG" in
          help)
            show_help
            exit 0
            ;;
          homedir)
            cwd="$HOME"
            ;;
          workdir)
            cwd="${!OPTIND}"
            [[ "$cwd" == -* ]] && error_exit 1 "missing argument for option '$OPTARG'."
            OPTIND+=1
            ;;
          workdir=*)
            cwd="${OPTARG#*=}"
            ;;
          hold | noclose)
            hold=1
            ;;
          debug)
            DEBUG=1
            ;;
          *)
            error_exit 1 "unkshown option '$OPTARG'."
            ;;
        esac
        ;;
      p)
        add_profile_setting "$OPTARG"
        ;;
      e)
        shift $((OPTIND - 2))
        cmd="$@"
        break
        ;;
      t)
        title="$OPTARG"
        ;;
      h)
        cwd="$HOME"
        ;;
      w)
        cwd="${OPTARG#*=}"
        ;;
      q)
        show=0
        ;;
      \?)
        error_exit 1 "unkshown option '$OPTARG'."
        ;;
      :)
        error_exit 1 "missing argument for option '$OPTARG'."
        ;;
    esac
  done

  debug <<-EOF
Command line options parsed:
 - PROGRAM_NAME=$PROGRAM_NAME
 - DEBUG=$DEBUG

 - title=$title
 - cwd=$cwd
 - hold=$hold
 - show=$show
EOF

  if [[ -n "$cwd" && ! -d "$cwd" ]]; then
    error_exit 2 "working directory does not exist"
  fi

  if [[ -z "${cmd// }" ]]; then
    cmd="true"
  fi

  local dbus_cmd="$(detect_dbus_cmd)"
  init_ipc_interface "$dbus_cmd"

  # Create a new terminal session in Yakuake
  local session=$(yakuake_addsession || error_exit 4 'cannot create a new session in Yakuake')

  SESSION_FILE="$(mktemp --tmpdir "$PROGRAM_NAME-XXXXXXXXXX")"
  {
    echo "#!/bin/env bash"

    echo "clear"
    echo "rm -f '$SESSION_FILE'"

    echo "$(profile_setup_command)"
    echo "cd '$cwd'"
    echo "$cmd"

    if [[ "$hold" = "0" ]]; then
        echo "qdbus6 org.kde.yakuake /yakuake/sessions removeSession $session"
    else
        ## TODO: Figure out a way to close the outer session once the inner session exits
        echo "exec bash -i"
    fi
  } > "$SESSION_FILE"

  debug "Session file: $SESSION_FILE"
  debug "$(cat "$SESSION_FILE")"

  # Overwrite session title after run command
  if [ -n "$title" ]; then
    yakuake_settitle "$session" "$title"
  fi

  chmod +x "$SESSION_FILE"
  yakuake_runcommand "$session" "$SESSION_FILE" || error_exit 7 'cannot run a command inside the new session'

  # Show the window of Yakuake
  if [[ "$show" = "1" ]]; then
    yakuake_showwindow
  fi
}

# Detect if the script was called with a different user who logged in
logged_user="$(logname)"
if [ "$UID" == 0 ] && [ "$logged_user" != "$USER" ]; then
  su "$logged_user" -c "$0" "$@" -- "$0" "$@"
else
  main "$@"
fi
