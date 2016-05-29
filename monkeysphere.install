#!/bin/sh
# $Id: monkeysphere.install 264 2010-11-10 00:57:53Z shtrom $
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
 /bin/true
}

# arg 1:  the new package version
post_install() {
  echo ">>> Creating monkeysphere user and group and setting permissions..."
  getent group monkeysphere >/dev/null || usr/sbin/groupadd monkeysphere
  getent passwd monkeysphere >/dev/null || usr/sbin/useradd -c 'Monkeysphere WoT server identification tool' -g monkeysphere -d '/var/lib/monkeysphere' -s /bin/bash monkeysphere
  chown monkeysphere:monkeysphere /var/lib/monkeysphere
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
 /bin/true
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
 /bin/true
}

# arg 1:  the old package version
pre_remove() {
  usr/sbin/userdel monkeysphere &>/dev/null
  (getent group monkeysphere >/dev/null && usr/sbin/groupdel monkeysphere &>/dev/null) || /bin/true
}

# arg 1:  the old package version
post_remove() {
 /bin/true
}

