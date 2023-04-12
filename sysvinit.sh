CONFIG_FILE=/etc/remoteit/config.json
PIDDIR=/var/run

r3_start_service() {
  echo "Start Service $1 $2"
  if [ -z $2 ]; then
    /etc/init.d/$1 start
  else
    /etc/init.d/$1 start $2
  fi
}

r3_stop_service() {
  echo "Stop Services $1 $2"
  if [ -z $2 ]; then
    /etc/init.d/$1 stop
    [ -r "$PIDDIR/$1.pid" ] && rm $PIDDIR/$1.pid
  else
    /etc/init.d/$1 stop $2
    [ -r "$PIDDIR/$1-$2.pid" ] && rm $PIDDIR/$1-$2.pid
  fi
}

r3_start_services() {
  echo "Start Services $1"
  r3_start_service schannel
  ids=
  if [ -r $CONFIG_FILE ]; then
    for id in $(jq -r '.device,.services[] | .sha' "$CONFIG_FILE"); do
      ids="$ids $id"
    done
  fi

  for pidfile in $PIDDIR/remoteit-*.pid ; do
    chmod 0644 $pidfile 2>/dev/null
    id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
    if [ "$id" != "*" ]; then
      ids="$ids $id"
    fi
  done

  unique_ids=$(echo $ids |tr ' ' '\n' |sort -u)
  for id in $unique_ids ; do
    r3_start_service remoteit $(echo $id)
  done
  return 0
}

r3_stop_services() {
  if ls /var/run/remoteit-*.pid > /dev/null 2>&1; then
    for pidfile in $PIDDIR/remoteit-*.pid ; do
      chmod 0644 $pidfile 2>/dev/null
      id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
      r3_stop_service remoteit $id
    done
  fi
  r3_stop_service schannel
  return 0
}
