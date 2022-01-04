#!/bin/bash

_pkgname='universalpaperclips'
_start="/usr/lib/${_pkgname}/start.html"

_usage() {
  printf '%s\n' "Universal Paperclips, standalone offline version." "(This simply opens pre-downloaded HTML and JavaScript with 'electron'.)" "" "Usage:" "  $0 <electron options>" "" "(For a list of options which 'electron' accepts, simply run 'electron' without any option or as 'electron -h' from the command line.)" "Most probably, you just want to run without any options, e.g. just '$0'." "" "You can also run it within a browser of your choice: Simply open '${_start}' in your browser."
}

_cheat_info() {
  printf '%s\n' "For cheating, open the JavaScript-console (press <CTRL>+<SHIFT>+<I> in the window of the 'electron' app and then click on the 'console' tab)." "" "For cheat codes, see e.g." "* http://reddit.com/r/pAIperclip/comments/8bspa8," "* http://reddit.com/r/pAIperclip/comments/779bj8," "* http://universalpaperclips.fandom.com/wiki/Cheats," "* http://universalpaperclips.fandom.com/wiki/Automation_(cheat)."
}

_electron_help() {
  printf '%s\n' "To pass '-h' to 'electron', which is used to run universal paperclips, "
}

if [ "$#" -ge 1 ]; then
  case "$1" in
    '-h'|'--help')
      _usage
      printf '\n\n'
      _cheat_info
      exit 0
    ;;
  esac
fi

electron "$@" "${_start}"
