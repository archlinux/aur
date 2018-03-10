#!/bin/sh

add_redsocks_user() {
  getent group redsocks &>/dev/null || groupadd -r redsocks >/dev/null
  getent passwd redsocks &>/dev/null || useradd -r -g redsocks -d / -s /bin/false -c redsocks redsocks >/dev/null
  systemd-tmpfiles --create redsocks.conf
}

post_install() {
  add_redsocks_user
  cat << EOF
To launch redsocks:

1. Start an ssh tunnel on port 4711
2. Start the redsocks and iptables daemons:

    rc.d start redsocks iptables

3. Load the redsocks iptables rules:

    iptables-restore /etc/iptables/redsocks.rules
EOF
}

post_upgrade() {
  add_redsocks_user
}

post_remove() {
  getent passwd redsocks &>/dev/null && userdel redsocks >/dev/null
  getent group redsocks &>/dev/null && groupdel redsocks >/dev/null
  true
}
