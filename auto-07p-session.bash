#!/bin/bash
AUTO_DIR='/opt/auto/07p'
export AUTO_DIR

PATH="${AUTO_DIR}/cmds:${AUTO_DIR}/bin:${PATH}"
export PATH

USER_RCFILE=~/".auto/auto.bashrc"
if [ -e "${USER_RCFILE}" ]; then
  rcfile_opt="--rcfile ${USER_RCFILE}"
else
  rcfile_opt="--norc"

  ### In case there is no user specified rc-file, set a reasonable prompt indicating that we have AUTO-environemnt variables loaded. ###
  if [ -n "${PS1}" ]; then
    PS1_GENERAL="${PS1}"
  else
    PS1_GENERAL='[\u@\h] [\w] '
  fi

  PS1_AUTO_PREFIX=''

  PS1_AUTO_SUFFIX='[AUTO-07P SESSION]\$ '

  PS1="${PS1_AUTO_PREFIX}${PS1_GENERAL}${PS1_AUTO_SUFFIX}"
  export PS1

fi

if [ "$#" -gt "0" ]; then # If there are command line arguments given, we want to execute them.
  run_mode_opt="-i -c"
else
  run_mode_opt="-i"
fi


bash --noprofile ${rcfile_opt} ${run_mode_opt} "$@"
