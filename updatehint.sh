#!/bin/bash

UPDATE_CHECK_CMD_ARCH="/usr/bin/checkupdates"
UPDATE_CHECK_CMD_AUR="/usr/bin/cower --color=never -u"
NO_UPDATES_TEXT="No updates available."
VERBOSE="false"
LOCKFILE="${HOME}/.$(basename $0).lock"

UPDATE_HEADER_ARCH="====== ARCH UPDATES ======\n"
UPDATE_HEADER_AUR="====== AUR  UPDATES ======\n"

ICON_UPDATES_AVAILABLE='software-update-urgent-symbolic'
ICON_UPDATES_NONE='emblem-ok-symbolic'


trap "{ rm -f ${LOCKFILE}; exit 2; }" EXIT


update_notify () {
  UPDATES_ARCH=$($UPDATE_CHECK_CMD_ARCH)
  UPDATES_AUR=$($UPDATE_CHECK_CMD_AUR | sed 's/:: \(.*\)/\1/')
  
  if [ -n "$UPDATES_ARCH" ]; then
    UPDATE_HEADER_ARCH_LOCAL="$UPDATE_HEADER_ARCH"
  fi
  if [ -n "$UPDATES_AUR" ]; then
    UPDATE_HEADER_AUR_LOCAL="$UPDATE_HEADER_AUR"
    if [ -n "$UPDATES_ARCH" ]; then
      UPDATE_HEADER_AUR_LOCAL="\n\n${UPDATE_HEADER_AUR_LOCAL}"
    fi
  fi

  if [ -n "$UPDATE_HEADER_ARCH_LOCAL" ] || [ -n "$UPDATE_HEADER_AUR_LOCAL" ]; then
    if [ "$USE_STDOUT" != "true" ]; then
      zenity --notification \
             --window-icon="$ICON_UPDATES_AVAILABLE" \
             --text="${UPDATE_HEADER_ARCH_LOCAL}${UPDATES_ARCH}${UPDATE_HEADER_AUR_LOCAL}${UPDATES_AUR}"
    else
      echo -e "${UPDATE_HEADER_ARCH_LOCAL}${UPDATES_ARCH}${UPDATE_HEADER_AUR_LOCAL}${UPDATES_AUR}"
    fi
    return 0
  elif [ "$VERBOSE" == 'true' ]; then
    if [ "$USE_STDOUT" != "true" ]; then
      zenity --notification \
             --window-icon="$ICON_UPDATES_NONE" \
             --text="$NO_UPDATES_TEXT"
    else
      echo "$NO_UPDATES_TEXT"
    fi
  fi
  return 1
}

print_help () {
  if which tput &>/dev/null; then
    underline=$(tput smul)
    nounderline=$(tput rmul)
    bold=$(tput bold)
    normal=$(tput sgr0)
  else
    unset underline nounderline bold normal
  fi
  echo \
"${bold}NAME${normal}
       $(basename $0) - Provides notifications about Arch Linux updates.

${bold}SYNOPSIS${normal}
       $(basename $0) [${underline}options${nounderline}]...

${bold}DESCRIPTION${normal}
       ${bold}$(basename $0)${normal} is a simple Bash script that utilizes other tools 
       to check for updates as unprivileged user.
       Those tools can be chosen by editing variables ${underline}UPDATE_CHECK_CMD_ARCH${nounderline}
       and ${underline}UPDATE_CHECK_CMD_AUR${nounderline} in this script.
       Currently the following commands are used:
              ${bold}Arch:${normal} ${UPDATE_CHECK_CMD_ARCH}
              ${bold}AUR: ${normal} ${UPDATE_CHECK_CMD_AUR}
       Update notifications are displayed on desktop if both zenity is 
       available and ${underline}DISPLAY${nounderline} is found in environment. 
       Otherwise information is printed to standard output.

${bold}OPTIONS${normal}
       -h, -?, --help
              Display this helpful information.
       -i ${underline}n${nounderline}, --interval ${underline}n${nounderline}
              Check regularly every ${underline}n${nounderline} minutes.
       -s, --stdout
              Print to standard out even if zenity and ${underline}DISPLAY${nounderline} are found.
       -v, --verbose
              Notify even when no updates available.

${bold}EXIT STATUS${normal}
       Exits with status 0 if available updates were found.
       If no updates could be found 1 is returned, in case of errors 2.

${bold}NOTES${normal}
       It could be helpful to add ${bold}$(basename $0)${normal} to either the startup functionality 
       of your desktop environment (e.g. as desktop file in ${underline}~/.config/autostart/${nounderline})
       or your (global or local) ${underline}.bashrc${nounderline}.
       Here is an example how it could be added to your ${underline}~/.bashrc${nounderline}:
              # Display hourly update notifications
              if [ -n \"\$DISPLAY\" ]; then
                nohup $(basename $0) -i 60 &>/dev/null &
              fi
       This will start ${bold}$(basename $0)${normal} only if ${underline}DISPLAY${nounderline} is available and
       detach it from the terminal session.
       
       A lock file is automatically checked and (if not present) created. This 
       prevents ${bold}$(basename $0)${normal} from being run several times. 
       When the lock file is present intervals are not allowed and the program 
       terminates with a hint. 
       The lock file will usually be deleted when the program terminates but
       in some cases (e.g. system crash) the file can stay present even after 
       ${bold}$(basename $0)${normal} has terminated. In that case it can help running 
       ${bold}$(basename $0)${normal} from a terminal emulator of  your choice so that you can 
       read the hint and see if that is the case and where that file is located 
       (should be ${underline}${LOCKFILE}${nounderline}).

${bold}BUGS${normal}
       If you stumble upon some bugs or have helpful thoughts to share, feel 
       free to leave a comment at AUR (see section HOMEPAGE).
       
${bold}HOMEPAGE${normal}
       https://aur.archlinux.org/packages/updatehint

${bold}AUTHOR${normal}
       Tinxy <arch äŧ tinx ðøŧ eu>
"
}


# Evaluate command line parameters
while [ -n "$1" ]; do
  if [ "$1" == '-h' ] || [ "$1" == '--help' ] || [ "$1" == '-?' ]; then
    print_help
    exit 2
  elif [ "$1" == "-i" ] || [ "$1" == "--interval" ]; then
    CHECK_INTERVAL="$2"
    shift; shift
  elif [ "$1" == "-s" ] || [ "$1" == "--stdout" ]; then
    USE_STDOUT="true"
    shift
  elif [ "$1" == "-v" ] || [ "$1" == "--verbose" ]; then
    VERBOSE="true"
    shift
  else
    echo "Illegal parameter: $1"
    exit 2
  fi
done

if [ -e "$LOCKFILE" ]; then
  trap - EXIT # clears trap to keep lockfile
  if [ -n "$CHECK_INTERVAL" ]; then
    echo -e "Found lockfile at: ${LOCKFILE}\nExiting."
    exit 2
  fi
else
  touch "$LOCKFILE"
fi


# Checking for DISPLAY and zenity
if [ -z "$DISPLAY" ] || ! which zenity &>/dev/null; then
  USE_STDOUT="true"
fi


# Execute update check
while true; do
  update_notify
  if [ -z "$CHECK_INTERVAL" ] || [ "$CHECK_INTERVAL" -lt 1 ]; then
    exit $?
  fi
  sleep "${CHECK_INTERVAL}m" || exit 2
done
