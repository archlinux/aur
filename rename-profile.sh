#!/bin/bash

# Wrapper around iceweasel to ensure that an existing iceweasel per-user profile directory
# is properly moved or copied before launching iceweasel when a directory rename is needed.
# This is only a convenience to users. User preferences would be lost without this hackery.


# NOTE: Prior to v99, if another Firefox is installed in addition to Iceweasel,
#       both applications would share a profile, which is not very sane behavior.
#       Iceweasel's ~/.mozilla/firefox dir was moved to ~/.mozilla/iceweasel.
# NOTE: Starting at v137, mozilla expects/moves the ~/.mozilla dir to ~/.parabola.
#       We rather move it to the conventional ~/.local/share/iceweasel.
# TODO: This source file could be deleted after a reasonable deprecation period.

# NOTE: The Iceweasel binary is inaccessible via the usual means
#       (`iceweasel`, `/usr/bin/iceweasel`, or the iceweasel.desktop launcher).
#       The binary has been renamed to ice-weasel, and replaced by this script.
#       Therefore all usual means of launching, will go through this script.


_SHOULD_PROMPT=1 # v99
_SHOULD_PROMPT=0 # dont ask this time (v137) - just move it


DeferRunning()
{
  gxmessage -title    "Parabola Iceweasel Updater" \
            -buttons  "OK:0"                       \
            -default  "OK"                         \
            -font     "sans 16"                    \
            -geometry 620x460                      \
            -center -wrap -ontop -sticky           \
"A new version of Iceweasel has been installed;
but the upgrade can not continue just yet.

A previous version of Iceweasel is already running.

Please close all running Iceweasel windows,
then start Iceweasel again.

If this message persists, try restarting the computer."
}

DeferDelete()
{
  gxmessage -title    "Parabola Iceweasel Updater" \
            -buttons  "OK:0"                       \
            -default  "OK"                         \
            -font     "sans 16"                    \
            -geometry 620x460                      \
            -center -wrap -ontop -sticky           \
"A new version of Iceweasel has been installed;
but the upgrade can not continue just yet.

$HOME/.parabola exists. You must delete it before restarting Iceweasel."
}

Prompt()
{
  gxmessage -title    "Parabola Iceweasel Updater" \
            -buttons  "Move:0,Copy:1"              \
            -default  "Move"                       \
            -font     "monospace 12"               \
            -geometry 780x580                      \
            -center -wrap -ontop -sticky           \
"A new version of Iceweasel has been installed; but the upgrade can not continue just yet.

This upgrade intends to move the storage location of the Iceweasel user profile, from ~/.mozilla/firefox to ~/.mozilla/iceweasel, in order to isolate it from other Firefox variants.

You have two options:

  * 'Move': This is the recommended option,
            if you do not have any other Firefox variants installed.
            However, if you have another Firefox variant installed,
            the other's preferences may be reset to defaults.
            Parabola does not distribute any other Firefox variant,
            which would be affected by this decision.
            If all software on your computer came from the Parabola
            repos (as recommended), then 'Move' is the best option.

  * 'Copy': If you have another Firefox variant installed,
            it will keep all user preferences as they are,
            and Iceweasel will inherit the preferences.

Note that neither option would affect Icecat, nor any other Firefox variant
which does not store user profiles under ~/.mozilla/firefox.
"
}

Launch()
{
  local err_msg="FATAL: ~/.local/share/parabola exists but is not a directory - delete it to continue"
  local err_msg2="FATAL: ~/.parabola exists but is not a symlink - delete it to continue"

  # since v137, the per-user profile location is expected at ~/.parabola
  # TODO: patch the source to expect ~/.local/share/parabola/iceweasel and delete this symlink # :)
  if   [[ ! -e ~/.local/share/parabola || -d ~/.local/share/parabola ]] &&
       [[ ! -e ~/.parabola             || -h ~/.parabola             ]]
  then mkdir -p ~/.local/share/parabola ; ln -fsT .local/share/parabola ~/.parabola ;          # :(
       /usr/lib/iceweasel/ice-weasel "$@"
  elif [[ -e ~/.local/share/parabola && ! -d ~/.local/share/parabola ]]
  then echo "${err_msg}"  ; DeferDelete ;
  elif [[ -e ~/.parabola && ! -h ~/.parabola ]]
  then echo "${err_msg2}" ; DeferDelete ;
  fi
}


if   [[ -d ~/.mozilla/iceweasel              ]] &&
   ! [[ -e ~/.local/share/parabola/iceweasel ]]
then # This is the expected case, where the user has previously run
     # Iceweasel on this system;
     # and this is the first time, that this script has run.
     pids=( $(pgrep --euid ${EUID} iceweasel) )
     if   [[ -n "${pids[*]/$$/}" ]]
     then # In this case, Iceweasel is already running;
          # so ask the user to terminate it.
          DeferRunning
     else # Ready to move the profile directory.
          # Give the user the option to preserve the Iceweasel profile.
          mkdir -p ~/.local/share/parabola # aka: $XDG_DATA_DIR/parabola
          if   (( ! _SHOULD_PROMPT )) || Prompt
          then mv    ~/.mozilla/iceweasel ~/.local/share/parabola/iceweasel
          else cp -a ~/.mozilla/iceweasel ~/.local/share/parabola/iceweasel
          fi
          # Try to delete ~/.mozilla.
          for d in $(find ~/.mozilla/ -maxdepth 1 -type d | tac) ; do rmdir ${d} 2> /dev/null ; done ;

          # Then launch the binary.
          Launch "$@"
     fi
else # This branch is executed in any of three cases:
     # 1) The last run of Iceweasel was the version at or later than the v99 migration
     #    but a version prior to the v137 migration,
     #    AND oddly, ~/.parabola or .local/share/parabola exist.
     #    This is potentially problematic but is easily resolved manually:
     #      $ rm -rf ~/.parabola/iceweasel .local/share/iceweasel
     # 2) The expected case, where the user has previously selected 'Copy'
     #    during this or a previous run of this script since the v137 migration period.
     # 3) The remaining expected case, where the user has never run any version of
     #    Iceweasel on this system, or has otherwise skipped the v99 migration period,
     #    or has deleted the working per-user iceweasel directory.
     # So, simply launch the binary.
     Launch "$@"
fi
