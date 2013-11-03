#!/bin/sh

sd_booted() {
  [ -e sys/fs/cgroup/systemd ]
}

add_privs() {
  if ! setcap "$2" "$1" 2>/dev/null; then
    echo "==> Warning: setcap failed, falling back to setuid root on /$1"
    chmod u+s "$1"
  fi
}

post_common() {
  systemd-machine-id-setup

  add_privs usr/bin/systemd-detect-virt 'cap_dac_override,cap_sys_ptrace+ep'

  udevadm hwdb --update
  journalctl --update-catalog

  if sd_booted; then
    systemctl --system daemon-reexec
  fi
}

mask_net_naming() {
  if [ ! -e etc/udev/rules.d/80-net-name-slot.rules ]; then
    printf >etc/udev/rules.d/80-net-name-slot.rules '# %s\n' \
      "This file masks persistent renaming rules for network devices. If you" \
      "delete this file, /usr/lib/udev/rules.d/80-net-name-slot.rules may" \
      "rename network devices according to ID_NET_NAME_{ONBOARD,SLOT,PATH}" \
      "properties of your network devices, with priority in that order. See" \
      "the output of 'udevadm test-builtin net_id /sys/class/net/\$interface'" \
      "for details on what that new name might be." \
      "" \
      "http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames"
  fi
}

_208_changes() {
  chown root:systemd-journal var/log/journal
  chmod 2755 var/log/journal

  if [ -e var/lib/backlight ] && [ ! -e var/lib/systemd/backlight ]; then
    mv -T var/lib/backlight var/lib/systemd/backlight
  fi

  if [ -e var/lib/random-seed ] && [ ! -e var/lib/systemd/random-seed ]; then
    mv -T var/lib/random-seed var/lib/systemd/random-seed
  fi
}

post_install() {
  post_common

  # enable getty@tty1 by default, but don't track the file
  systemctl enable getty@tty1.service

  echo ":: Append 'init=/usr/lib/systemd/systemd' to your kernel command line in your"
  echo "   bootloader to replace sysvinit with systemd, or install systemd-sysvcompat"
}

post_upgrade() {
  post_common

  # getty@tty1.service is no longer enabled by default, but we don't want to break
  # existing setups.
  if [ "$(vercmp 183 "$2")" -eq 1 ]; then
    # systemctl seems to be whiny on sysvinit. this will succeed unless something
    # horrific happens, so just mask the error.
    systemctl -q enable getty@tty1.service || true
  fi

  if [ "$(vercmp 194-4 "$2")" -eq 1 ]; then
    printf '==> journald now writes to /var/log/journal by default. This can be\n'
    printf '    controlled with the Storage setting in /etc/systemd/journald.conf\n'
  fi

  # logind's protocol changed. kindly restart the daemon to avoid locking
  # out further logins.
  if [ "$(vercmp 195 "$2")" -eq 1 ]; then
    if sd_booted; then
      systemctl restart systemd-logind.service
    fi
  fi

  if [ "$(vercmp 196-1 "$2")" -eq 1 ]; then
    printf '==> The legacy configuration options are no longer supported in rc.conf,\n'
    printf '    convert your rc.conf to the new configuration formats.\n'
  fi

  if [ "$(vercmp 197-1 "$2")" -eq 1 ]; then
    mask_net_naming
    printf '==> Persistent net naming rules have been shipped as disabled.\n'
    printf '    See /etc/udev/rules.d/80-net-name-slot.rules for more detail\n'
  fi

  if [ "$(vercmp 204-1 "$2")" -eq 1 ]; then
    printf '==> The /bin/systemd symlink has been removed. Any references in your\n'
    printf '    bootloader (or elsewhere) must be updated to /usr/lib/systemd/systemd.\n'
  fi

  if [ "$(vercmp 205-1 "$2")" -eq 1 ]; then
    printf '==> systemd 205 restructures the cgroup hierarchy and changes internal\n'
    printf '    protocols. You should reboot at your earliest convenience.\n'
  fi

  if [ "$(vercmp 206-1 "$2")" -eq 1 ]; then
    printf '==> The "timestamp" hook for mkinitcpio no longer exists. If you used\n'
    printf '    this hook, you must remove it from /etc/mkinitcpio.conf. A "systemd"\n'
    printf '    hook has been added which provides this functionality, and more.\n'
  fi

  if [ "$(vercmp 208-1 "$2")" -eq 1 ]; then
    _208_changes
  fi
}

# vim:set ts=2 sw=2 et:
