#!/bin/bash
# 0.2:
#    dracorp: parametry -noass i -noquiet

msg() {
  printf "\e[0;32;1m==> \e[0;1m%s..\e[0m" "$1"
}
msg_end() {
  if [ "$1" = "0" ]; then
    printf " \e[0;32;1mdobrze\e[0m\n"
  else
    printf " \e[0;33;1mblad\e[0m\n"
    exit $1
  fi
}

if [ -z "$@" ]; then
  echo "milena_mplayer [opcje mplayera]"
  exit
fi

msg "Przygotowywanie syntezy mowy"
mplayer -dumpjacosub -noass -ao null -vo null -frames 0 "$@" &> /dev/null
msg_end $?

msg "Odtwarzanie"
if [ -f "dumpsub.jss" ]; then
  (mplayer "$@" -softvol -noquiet | milena_subplayer dumpsub.jss) &> /dev/null
  msg_end $?
  rm dumpsub.jss
else
  mplayer "$@" &> /dev/null
  msg_end $?
fi
