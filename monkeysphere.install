#!/bin/sh
# $Id: monkeysphere.install 264 2010-11-10 00:57:53Z shtrom $
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
post_install() {
  echo ">>> Creating monkeysphere user and group and setting permissions..."
  getent group monkeysphere >/dev/null || groupadd monkeysphere
  getent passwd monkeysphere >/dev/null ||useradd -c 'Monkeysphere WoT server identification tool' -g monkeysphere -d '/var/lib/monkeysphere' -s /bin/bash monkeysphere

# Should be root:root for sshd to work
  chown root:root /var/lib/monkeysphere
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
# Should be root:root for sshd to work
  chown root:root /var/lib/monkeysphere
}

# arg 1:  the old package version
pre_remove() {
  userdel monkeysphere &>/dev/null
  (getent group monkeysphere >/dev/null && groupdel monkeysphere &>/dev/null) || /bin/true
}
