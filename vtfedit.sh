#!/bin/bash

name='vtfedit'
path='/usr/share/vtfedit'
bin='x86/VTFEdit.exe'

C_YELLOW='\e[33m'
C_CLEAR='\e[0m'

export WINEPREFIX="$HOME/.local/share/wineprefixes/$name"
export WINEARCH='win32'
export WINEDEBUG=-all

if [[ ! -d $WINEPREFIX ]]; then
  PROGRESS=$(mktemp)
  echo -e 'Preparing your wineprefix, this may take a while..\n'

  (winetricks -q winxp 2>&1 | tee -a $PROGRESS ) &
  PID_XP="$!"
  (winetricks -q dlls vcrun2005 dotnet35 2>&1 | tee -a $PROGRESS ) &
  PID_DLL="$!"
  echo $PIDS

  exec 3>&1

  (
    DONE_XP=0
    DONE_DLL=0

    MAX_LINES=152
    TICK=0

    while [[ 1 ]]; do
      LINES=$(cat $PROGRESS | wc -l)
      PCT="$(($(echo $LINES) * 100 / $MAX_LINES))"
      echo $PCT
      if [[ $TICK == 10 ]]; then
        TICK=0
        echo -e "$C_YELLOW==>$C_CLEAR $PCT% complete ($LINES/$MAX_LINES)" >&3
	echo -e "    XP: $DONE_XP DLLs: $DONE_DLL" >&3
      fi
      sleep 1

      if [[ $DONE_XP == 0 ]]; then
	ps -p $PID_XP $2>1 >/dev/null
        if [[ $? -ne 0 ]]; then
	  DONE_XP=1
	  echo -e "$C_YELLOW==>$C_CLEAR Finished winetricks winxp" >&3
        fi
      fi
      if [[ $DONE_DLL == 0 ]]; then
	ps -p $PID_DLL $2>1 >/dev/null
	if [[ $? -ne 0 ]]; then
	  DONE_DLL=1
	  echo -e "$C_YELLOW==>$C_CLEAR Finished winetricks DLLs" >&3
	fi
      fi

      if [[ $DONE_XP == 1 ]] && [[ $DONE_DLL == 1 ]]; then
        echo -e "$C_YELLOW==>$C_CLEAR wineprefix setup complete" >&3
	exit 0
      fi

      TICK=$(($TICK + 1))
    done
  ) | zenity --progress --title='VTFEdit' --text='Preparing wineprefix, this will take a while..' --time-remaining --auto-close --no-cancel
fi

declare -a args

for arg; do
  if [[ "${arg:0:1}" = "-" ]]; then
    args+=("${arg/#-//}")
  else
    args+=("$(winepath -w "$arg")")
  fi
done

wine $path/$bin "${args[@]}"

EXIT=$?

if [[ $EXIT -ne 0 ]]; then
  echo "error: vtfedit failed to launch!"
  echo -e "If vtfedit didn't start, you should try deleting your vtfedit\nwineprefix and restarting:"
  echo "  rm -rf $WINEPREFIX"
  exit $EXIT
fi
