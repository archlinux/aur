pre_upgrade() {
  if [[ $(vercmp $2 3.16-2) -lt 0 ]]; then
    if systemctl is-enabled -q remctl.service; then
      echo "Note: This package now ships upstream systemd units instead of custom ones."
      echo "      The unit 'remctl.service' is now called 'remctld.service'."
    fi

    if systemctl is-enabled -q remctl.socket; then
      # Mirror what packages/openssh does.
      echo "WARN: This package no longer ships the custom \"inetd style\" socket units"
      echo "      'remctl.socket' & 'remctl@.service'. Copies will remain on your system."
      echo "      Instead, upstream now provides a \"daemon\" socket unit 'remctld.socket'."
      for i in remctl{.socket,@.service}; do
        if [[ ! -e /etc/systemd/system/$i ]]; then
          cp -v /usr/lib/systemd/system/$i /etc/systemd/system/$i
        fi
      done
      systemctl reenable remctl.socket
    fi
  fi
}

# vim: ts=2:sw=2:et:ft=sh
