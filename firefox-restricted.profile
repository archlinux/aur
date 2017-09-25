# Mozilla Firefox
whitelist ${HOME}/Downloads

whitelist ${HOME}/.cache/gtk-3.0
whitelist ${HOME}/.cache/mozilla/firefox

whitelist ${HOME}/.config/fontconfig/fonts.conf
whitelist ${HOME}/.config/kdeglobals
whitelist ${HOME}/.config/pulse
whitelist ${HOME}/.config/user-dirs.dirs
whitelist ${HOME}/.config/user-dirs.locale

whitelist ${HOME}/.local/share/icons
whitelist ${HOME}/.local/share/mime
whitelist ${HOME}/.local/share/sounds

noblacklist ${HOME}/.mozilla
whitelist ${HOME}/.mozilla

whitelist ${HOME}/.nv
whitelist ${HOME}/.mime.types

noblacklist /run/dbus
noblacklist /run/firejail
noblacklist /run/systemd
noblacklist /run/udev
noblacklist /run/user
blacklist /run/.*
blacklist /run/*

whitelist /usr/lib/firefox
blacklist /boot
blacklist /mnt
blacklist /opt
blacklist /root
blacklist /srv

caps.drop all
seccomp
protocol unix,inet,inet6,netlink
netfilter
noroot

include /etc/firejail/whitelist-common.inc
include /etc/firejail/disable-devel.inc
