#!/bin/sh
# kwakd.install file.
# Copyright 2012 Tom Vincent <http://tlvince.com/contact/>

add_user() {
  getent group kwakd &>/dev/null || groupadd -r kwakd >/dev/null
  getent passwd kwakd &>/dev/null || \
    useradd -r -g kwakd -d / -s /bin/false -c kwakd kwakd >/dev/null
}

# Allow kwakd to bind to port 80 without root permissions
# See: http://stackoverflow.com/a/10552029
grant_bind() {
  setcap cap_net_bind_service=ep /usr/bin/kwakd
}

post_install() {
  add_user
  grant_bind
}

post_upgrade() {
  add_user
  grant_bind
}

post_remove() {
  getent passwd kwakd &>/dev/null && userdel kwakd >/dev/null
  getent group kwakd &>/dev/null && groupdel kwakd >/dev/null
  true
}
