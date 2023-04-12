#!/bin/sh

CONFIG_FILE=/etc/remoteit/config.json
PIDDIR=/var/run

# Detection of whether the user executing the shell is root
SUDO=
if [ $(id -u) -ne 0 ]; then
  SUDO=sudo
fi

r3_start_service() {
  if [ -z $2 ]; then
    $SUDO systemctl enable $1
    $SUDO systemctl reload-or-restart $1
  else
    $SUDO systemctl enable $1@$2
    $SUDO systemctl start $1@$2
  fi
}

r3_stop_service() {
  if [ -z $2 ]; then
    $SUDO systemctl disable $1
    $SUDO systemctl stop $1
  else
    $SUDO systemctl disable $1@$2
    $SUDO systemctl stop $1@$2
  fi
}

r3_start_services() {
  echo "Start Services $1"
  r3_start_service schannel
  ids=
  if [ -r $CONFIG_FILE ]; then
    for id in $(jq -r '.device,.services[] | .sha' "$CONFIG_FILE"); do
      ids="$ids$id|"
    done
  fi

  for pidfile in $PIDDIR/remoteit-*.pid ; do
    chmod 0644 $pidfile 2>/dev/null
    id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
    if [ "$id" != "*" ]; then
      ids="$ids$id|"
    fi
  done

  unique_ids=$(echo "$ids" | sed 's/|/\n/g' | sort | uniq)

  if [ -n "$unique_ids" ]; then
    for id in $unique_ids ; do
      r3_start_service remoteit "$id"
      config=$(jq -r --arg id "$id" '.device,.services[] | select(.sha==$id or .id==$id) | .config' "$CONFIG_FILE")
      if [ "$config" = "" ]; then
        systemctl stop remoteit@$id
        rm -r /etc/systemd/system/multi-user.target.wants/remoteit@$id.service
      fi
    done
  fi
}

r3_stop_services() {
  for pidfile in $PIDDIR/remoteit-*.pid ; do
    chmod 0644 $pidfile 2>/dev/null
    id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
    r3_stop_service remoteit $id
  done
    r3_stop_service schannel
}
