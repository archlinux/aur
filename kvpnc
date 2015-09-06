#!/bin/bash

. /etc/conf.d/kvpnc.conf

COMMAND_TIMEOUT=3
NAME="kvpnc"
DESC="Kerio Control VPN client"

dialogbox () {
  dialog \
    --backtitle "$DAEMON_NAME configuration" \
    --stdout \
    $5 \
    --title "$2" \
    "$1" "\n$3" 9 78 $4
}
  
inputbox () {
  dialogbox --inputbox "$1" "$2" "$3"
}

passwordbox () {
  # Insecure means that asterisks will be shown in the input field
  dialogbox --passwordbox "$1" "$2" "$3" --insecure
}

yesnobox () {
  dialogbox --yesno "$1" "$2" "$3"
  case "$?" in
    0)
      echo yes
      ;;
    1)
      echo no
      ;;
    *)
      ;;
  esac
}

messagebox () {
    dialogbox --msgbox "$1" "$2"
}

die () {
  echo "Procedure aborted: $2" >&2
  exit $1
}

execute_with_timeout() {
  local PID
  local TIMEOUT
  local ITERATION
  TIMEOUT=$1
  shift
  "$@" &
  PID=$!
  ITERATION=0
  while [ $ITERATION -lt $TIMEOUT ]; do
    # Check if the PID is still running
    [ ! -d "/proc/$PID" ] && return 0
    # Sleep 1 second for each iteration
    sleep 1
    ((ITERATION++))
  done
  # If the process is still running then try to kill it
  [ -d "/proc/$PID" ] && killtree $PID 9
  return 1
}

killtree() {
  # Kill a process and all its children (from children to parent)
  local _CHILD
  for _CHILD in $(ps -o pid --no-headers --ppid $1); do
    killtree ${_CHILD} ${2-TERM}
  done
  kill -${2-TERM} $1 1>&2 2> /dev/null
}

configure() {
  local SERVER_NAME
  local PORT_NUMBER
  local SSL_REPLY
  local AUTODETECT_FP
  local DETECTED_FP
  local ACCEPT_FP
  local FINGERPRINT
  local USER_NAME
  local PASSWORD
  local CONFIRM_PW
  local XOR_PW
  local ITERATION

  SERVER_NAME=$(inputbox \
    "Kerio VPN server address" \
    "Please enter the host name or IP address of your Kerio VPN server." \
  )
  [ -z "$SERVER_NAME" ] && die 2 "The Kerio VPN server address must be set."

  PORT_NUMBER=$(inputbox \
    "Kerio VPN server port number" \
    "Please enter the TCP port number of your Kerio VPN server." \
    "4090" \
  )
  [ -z "$PORT_NUMBER" ] && die 3 "The Kerio VPN server port number must be set."

  SSL_REPLY=$(execute_with_timeout $COMMAND_TIMEOUT bash -c "echo | \
      openssl s_client -ssl3 -connect $SERVER_NAME:$PORT_NUMBER 2> /dev/null"
  )
  [ -z $SSL_REPLY ] && die 4 "Unable to connect to the Kerio VPN server"

  AUTODETECT_FP=$(yesnobox \
    "Autodetect fingerprint" \
    "Automaticaly detect fingerprint from the Kerio VPN server?" \
  )
  [ -z "$AUTODETECT_FP" ] && die 5 "The user has cancelled."

  if [ "$AUTODETECT_FP" = "yes" ]
  then
    # Detect the SSL server fingerprint
    DETECTED_FP=$(echo "$SSL_REPLY" | \
      openssl x509 -fingerprint -md5 -noout | \
      sed s'/.*=//'
    )
    # A fingerprint was detected?
    if [ -z "$DETECTED_FP" ]
    then
      # Fingerprint not detected, ask for manual input
      messagebox \
        "Automatic fingerprint detection failed" \
        "The Kerio VPN server fingerprint was not automatically detected."
      AUTODETECT_FP="no"
    else
      # Accept the autodetected fingerprint?
      ACCEPT_FP=$(yesnobox \
        "Accept detected fingerprint?" \
        "The automatically detected fingerprint is $DETECTED_FP.\n\n
Please check if the automaticaly detected fingerprint is correct." \
      )
      [ $ACCEPT_FP = "yes" ] && FINGERPRINT="$DETECTED_FP"
    fi
  fi

  if [ "$AUTODETECT_FP" = "no" ]
  then
    # Ask for SSL server fingerprint
    FINGERPRINT=$(inputbox \
      "Kerio VPN server fingerprint" \
      "Enter the Kerio VPN server's fingerprint."
    )
  fi
  [ -z "$FINGERPRINT" ] && die 6 "The Kerio VPN server fingerprint must be set."

  USER_NAME=$(inputbox \
    "Kerio VPN server user name" \
    "Please enter the user name of your Kerio VPN server account." \
  )
  [ -z "$USER_NAME" ] && die 7 "User name must be set."

  PASSWORD=$(passwordbox \
    "Kerio VPN server password for user $USER_NAME" \
    "Please enter the password of your Kerio VPN server account." \
  )
  [ -z "$PASSWORD" ] && die 8 "Password must be set."

  CONFIRM_PW=$(passwordbox \
    "Kerio VPN server password for user $USER_NAME" \
    "Please confirm the previous password of your Kerio VPN server account." \
  )
  [ "$CONFIRM_PW" != "$PASSWORD" ] && die 9 "Confirmed password is different."

  for ITERATION in $(echo -n "$PASSWORD" | od -t d1 -A n)
  do
    XOR_PW=$(printf "%s%02x" "$XOR_PW" $((ITERATION ^ 85)))
  done
	cat > "$CFGFILE" << EOF
<config>
  <connections>
    <connection type="persistent">
      <server>${SERVER_NAME}</server>
      <port>${PORT_NUMBER}</port>
      <username>${USER_NAME}</username>
      <password>XOR:${XOR_PW}</password>
      <fingerprint>${FINGERPRINT}</fingerprint>
      <active>1</active>
    </connection>
  </connections>
</config>
EOF
	chmod 0600 "$CFGFILE"
}

case "$1" in
  start)
    # Check and prepare environment
    [ ! -f "$CFGFILE" ] && die 1 "Configuration file not found, configure with $0 configure"
    [ ! -d "$LIBDIR" ] && mkdir -p "$LIBDIR"
    [ ! -d "$LOGDIR" ] && mkdir -p "$LOGDIR"
    [ ! -h "$LIBDIR/logs" ] && ln -s -f -n "$LOGDIR" "$LIBDIR/logs"
    # Start the daemon and append the output to the system logger
    "$BINSVC" "$LIBDIR" > /dev/null
    # Get exit status of the first command BEFORE the pipe
    RET=$?
    if [ $RET -gt 0 ]; then
      die 1 "The kvpnsvc daemon died with exit code $RET"
    else
      pidof -o %PPID kvpncsvc > "$PIDFILE"
    fi
    ;;
  stop)
    killall -q kvpncsvc
    rm -f "$PIDFILE"
    ;;
  configure)
    configure
    ;;
  *)
    echo "usage: $0 {start|stop|configure}"
    ;;
esac
