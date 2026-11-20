#!/bin/bash
# Mount the previous and candidate packages at /old.pkg.tar.zst and /new.pkg.tar.zst.
set -euo pipefail
export LC_ALL=C
if [[ ${1:-} != fresh ]]; then
  pacman -U --noconfirm /old.pkg.tar.zst
  install -d /opt/UniVPN/{config,certificate,log}
  printf 'keep configuration\n' >/opt/UniVPN/config/test.ini
  printf 'keep certificate\n' >/opt/UniVPN/certificate/test.pem
  if [[ ${1:-} == aur-upgrade ]]; then
    test "$(pacman -Q univpn)" = 'univpn 10781.18.1.0512-10'
    install -d /usr/local/UniVPN/certificate
    printf 'legacy certificate\n' >/usr/local/UniVPN/certificate/legacy.pem
    printf 'legacy metadata\n' >/usr/local/UniVPN/certinfo.txt
    printf 'do not overwrite\n' >/usr/local/UniVPN/certificate/test.pem
    ln -s /etc/passwd /usr/local/UniVPN/certificate/skip-symlink.pem
  fi
fi
pacman -U --noconfirm /new.pkg.tar.zst
if [[ ${1:-} == aur-upgrade ]]; then
  test "$(< /opt/UniVPN/certificate/legacy.pem)" = 'legacy certificate'
  test "$(< /opt/UniVPN/certinfo.txt)" = 'legacy metadata'
  test "$(< /opt/UniVPN/certificate/test.pem)" = 'keep certificate'
  test ! -e /opt/UniVPN/certificate/skip-symlink.pem
  test "$(< /usr/local/UniVPN/certificate/legacy.pem)" = 'legacy certificate'
fi
if [[ ${1:-} != baseline-remove && ${1:-} != baseline-link ]]; then
  test ! -u /opt/UniVPN/UniVPNUpdate || { echo 'FAIL: updater is setuid'; exit 1; }
  if grep -Fq '/usr/local/UniVPN/certificate' /opt/UniVPN/language/{1033,2052}/l_UILabel.ini; then
    echo 'FAIL: stale certificate instructions'; exit 1
  fi
fi
if [[ ${1:-} == baseline-remove ]]; then
  pacman -R --noconfirm univpn
  test -f /opt/UniVPN/config/test.ini || { echo 'FAIL: uninstall deleted configuration'; exit 1; }
  exit 0
fi
if [[ -L /usr/local/UniVPN ]] || [[ ${1:-} != aur-upgrade && -e /usr/local/UniVPN ]]; then
  echo 'FAIL: package created /usr/local/UniVPN' >&2
  exit 1
fi
if [[ ${1:-} == fresh ]]; then
  install -d /opt/UniVPN/{config,certificate}
  printf 'keep configuration\n' >/opt/UniVPN/config/test.ini
  printf 'keep certificate\n' >/opt/UniVPN/certificate/test.pem
fi
install -d -m700 -o vpntest -g vpntest /run/user/1000
install -d /run/dbus
dbus-daemon --system --fork
Xvfb :99 -screen 0 1024x768x24 -nolisten tcp -ac >/tmp/xvfb-test.log 2>&1 &
export DISPLAY=:99
for i in {1..30}; do xwininfo -root >/dev/null 2>&1 && break; sleep .2; done
runuser -u vpntest -- env HOME=/home/vpntest XDG_RUNTIME_DIR=/run/user/1000 dbus-run-session -- /usr/bin/univpn >/tmp/univpn-test.log 2>&1 &
for i in {1..40}; do
  if xdotool search --onlyvisible --class '^UniVPN$' >/dev/null && pgrep -x UniVPNCS >/dev/null && pgrep -x UniVPNPromoteSe >/dev/null; then break; fi
  sleep .3
done
xwininfo -root -tree
xdotool search --onlyvisible --class '^UniVPN$' || { cat /tmp/{xvfb,univpn}-test.log; exit 1; }
pgrep -alx UniVPNCS
pgrep -alx UniVPNPromoteSe
ls -l /opt/UniVPN/config/key.ini /opt/UniVPN/log/*log
pacman -Qkk univpn
pkill -TERM -x UniVPN
pkill -TERM -x UniVPNCS || true
pkill -TERM -x UniVPNPromoteSe || true
pacman -R --noconfirm univpn
test "$(< /opt/UniVPN/config/test.ini)" = 'keep configuration'
test "$(< /opt/UniVPN/certificate/test.pem)" = 'keep certificate'
test ! -e /opt/UniVPN/UniVPN
printf 'PASS: %s, window, services, integrity, data preservation\n' "${1:-upgrade}"
