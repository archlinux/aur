#!/usr/bin/env bash

notice() {
  printf "${WHITE} $1${ALL_OFF}\n"
}

ALL_OFF="$(tput sgr0)"
BOLD="${ALL_OFF}$(tput bold)"
BLACK="${BOLD}$(tput setaf 0)"
RED="${BOLD}$(tput setaf 1)"
GREEN="${BOLD}$(tput setaf 2)"
YELLOW="${BOLD}$(tput setaf 3)"
BLUE="${BOLD}$(tput setaf 4)"
MAGENTA="${BOLD}$(tput setaf 5)"
CYAN="${BOLD}$(tput setaf 6)"
WHITE="${BOLD}$(tput setaf 7)"

notice 'Abricotine development and support ceased in July 2023.'
notice 'The developer recommends using a different editor because'
notice 'Abricotine "hasn'\''t evolved in years and some dangerous'
notice 'bugs have recently been reported"'
notice
notice 'https://github.com/brrd/abricotine/issues/347'
echo

if ! tty -s ; then
  _message=''
  _message+=' The developer recommends using a different editor because Abricotine'
  _message+=' "hasn'\''t evolved in years and some dangerous bugs have recently'
  _message+=' been reported".\n\n'

  notify-send --urgency=critical -a "Abricotine" "Project discontinued" "$_message"
fi

sleep 2
exec /opt/abricotine/abricotine "$@"
