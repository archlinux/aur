#!/bin/bash
# replaces xdg-open
# inspired from mimi: https://github.com/taylorchu/mimi

_LINOPEN_CFGRC="$HOME/.linopenrc"
_LINOPEN_CFGSYS="/etc/linopen.conf"
_LINOPEN_CFGARG=

# helpers
err() { echo "$@"; exit 1; }
usage() { echo "usage: $(basename $0) [-c <config>] [file]"; }

# pipe configuration
getconfig() {
   # '#' are comments in configuration :)
   [[ -f "$_LINOPEN_CFGARG" ]] && { egrep -v "^(#|$)" "$_LINOPEN_CFGARG"; return; }
   [[ -f "$_LINOPEN_CFGRC" ]]  && { egrep -v "^(#|$)" "$_LINOPEN_CFGRC"; return; }
   [[ -f "$_LINOPEN_CFGSYS" ]] && { egrep -v "^(#|$)" "$_LINOPEN_CFGSYS"; return; }
}

# match regexp
# $1 = filename
match_regexp() {
   open_with=''
   getconfig | grep "^?" | while read cf; do
      exp="$(echo "$cf" | sed "s/?'\(.*\)':.*/\1/")"
      [[ -n "$(echo "$@" | grep "$exp")" ]] && {
         open_with="$(echo "$cf" | sed "s/?'.*':\(.*\)/\1/")";
      }
      # exit the loop once a match is encountered
      [[ ! "${open_with}" = '' ]] && echo "${open_with}" && exit 0
   done
}

# get terminal emulator from configuration
get_term() {
   # inside echo (strip whitespace)
   echo $(getconfig | grep -w "^terminal" | head -1 | cut -d = -f 2 | sed 's/[#].*//')
}

# check, if program needs terminal
# $1 = program
needs_term() {
   [[ -n "$(getconfig | grep -w "^interm=$@")" ]] &&
      return 0 || return 1
}

# check, if we need fork for terminal program
needs_fork() {
   # is either ran from shell or from script
   if [[ "$(ps -o stat= -p $PPID)" == *S* ]]; then
      # + == not backgrounded
      [[ "$(ps -o stat= -p $$)"    == *+* ]] &&
         return 1 || return 0
   fi
}

# launch file with correct program
# $1 = filename
# $2 = forced program
launch() {
   local program="$2"
   local interm=0

   # is directory?
   [[ -d "$1" ]] && {
      program="$(getconfig | grep "^directory:" | cut -d : -f 2)"
   }

   # if not directory, and file doesn't exist
   # try matching regexp
   [[ ! -n "$program" ]] && [[ ! -f "$1" ]] &&
      regexp="$(match_regexp "$1")"

   # if file not found and no matching regexp
   [[ ! -f "$1" ]] && [[ ! -d "$1" ]] && [[ ! -n "$regexp" ]] && {
      err "file does not exist: $1";
   } || {
      [[ -n "$program" ]] || program="$regexp"
   }

   # test against extension
   [[ -n "$program" ]] || {
      local ext=${1##*.};
      program="$(getconfig | grep "^.$ext:" | cut -d : -f 2)"
   }

   # test against whole mime type
   [[ -n "$program" ]] || program="$(getconfig | \
      grep "^$(file -L -b --mime-type "$1"):" | head -1 | cut -d : -f 2)"

   # test against video/, text/ (first part of mime type)
   [[ -n "$program" ]] || program="$(getconfig | \
      grep "^$(file -L -b --mime-type "$1" | sed 's/\(.*\)\/.*/\1:/')" | \
      head -1 | cut -d : -f 2)"

   # test against regexp
   [[ -n "$program" ]] || program="$(match_regexp "$1")"

   # test against default as last try
   [[ -n "$program" ]] || program="$(getconfig | grep "^default:" | \
      head -1 | cut -d : -f 2)"

   # check arguments
   [[ -n "$(echo "$program" | grep "\->interm")" ]] && interm=1

   # sed out the arguments || comments
   program="$(echo "$program" | sed 's/->.*//;s/[#].*//')"
   program="$(echo $program)" # strip leading&&trailing whitespace

   # check if program is enviroiment variable
   [[ -n "$(echo "$program" | grep '^\$')" ]] && {
      program="$(echo "$program" | sed 's/^\$//')"
      program="$(env | grep "$program" | head -1 | cut -d = -f 2)"
   }

   # no program found
   [[ -n "$program" ]] ||
      err "could not find program for '$(basename $1)', check your configuration"

   # check if we need term or fork
   if [[ $interm -eq 1 ]] || needs_term "$program"; then
      if needs_fork; then
         # open in new terminal
         "$(get_term)" -e "$program" "$1" &
      else
         # open in current terminal
         "$program" "$1"
      fi
   else
      # echo program is exception here
      [[ "$program" == "echo" ]] && { echo "$1"; } || {
         # open in background (redirects everything to /dev/null)
         "$program" "$1" &> /dev/null &
      }
   fi
}

# handle file
# $1 = filename
handle() {
   local filename="$@"
   [[ -n "$(echo $filename | grep "^file://")" ]] && {
      filename="${filename##file://}"
   }
   launch "$filename"
}

main() {
   # print usage if no arguments
   [[ -n "$@" ]] || { usage; exit 1; }

   # check configuration argument
   [[ "$1" == "-c" ]] && {
      shift 1; _LINOPEN_CFGARG="$1";
      [[ -f "$_LINOPEN_CFGARG" ]] ||
         err "no configuration exists: $_LINOPEN_CFGARG"
      shift 1
   }

   # check that everything is ok
   [[ -n "$(getconfig)" ]] ||
      err "no configuration exists: /etc/linopen.conf || ~/.linopenrc or the file is empty"
   [[ -n "$(getconfig | grep "^default:")" ]] ||
      err "rule must exist in configuration: 'default:'"

   # handle arguments
   while [[ -n "$1" ]]; do
      handle "$1"
      shift || break
   done
}
main "$@"

# vim: set ts=8 sw=3 tw=0 :
