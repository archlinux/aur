#!/bin/sh

CONFIG_FILE=/etc/remoteit/config.json
PIDDIR=/var/run

r3_start_service() {
  if [ -z $2 ]; then
    sudo systemctl enable $1
    sudo systemctl reload-or-restart $1
  else
    sudo systemctl enable $1@$2
    sudo systemctl start $1@$2
  fi
}

r3_stop_service() {
  if [ -z $2 ]; then
    sudo systemctl disable $1
    sudo systemctl stop $1
  else
    sudo systemctl disable $1@$2
    sudo systemctl stop $1@$2
  fi
}

r3_start_services() {
  echo "Start Services $1"
  r3_start_service schannel
  ids=
  if [ -r $CONFIG_FILE ]; then
    for id in $(jq -r '.device,.services[] | .id' "$CONFIG_FILE"); do
      ids="$ids$id\n"
    done
  fi

  for pidfile in $PIDDIR/remoteit-*.pid ; do
    chmod 0644 $pidfile 2>/dev/null
    id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
    if [ "$id" != "*" ]; then
      ids="$ids$id\n"
    fi
  done

  unique_ids=$(echo $ids | sort | uniq)

  for id in $(echo -e $unique_ids) ; do
    r3_start_service remoteit $(echo $id | tr -d '\\n')
    config=$(jq -r --arg id "$id" '.device,.services[] | select(.id==$id) | .config' "$CONFIG_FILE")
    if [ "$config" = "" ]; then
      systemctl stop remoteit@$id
      rm -r /etc/systemd/system/multi-user.target.wants/remoteit@$id.service
    fi
  done
}

r3_stop_services() {
  for pidfile in $PIDDIR/remoteit-*.pid ; do
    chmod 0644 $pidfile 2>/dev/null
    id=$(echo $pidfile | sed -e 's/\/var\/run\/remoteit-//g;s/.pid//g')
    r3_stop_service remoteit $id
  done
    r3_stop_service schannel
}
