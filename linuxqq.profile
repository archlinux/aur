# Firejail profile for linuxqq
# Description: IM client based on Electron
# Persistent local customizations
include linuxqq.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/QQ

mkdir ${HOME}/.config/QQ
whitelist ${HOME}/.config/QQ
whitelist ${DESKTOP}

ignore apparmor
noprinters

private-bin linuxqq,xdg-open,xdg-mime
private-etc alsa,alternatives,ca-certificates,crypto-policies,fonts,group,host.conf,hostname,hosts,ld.so.cache,ld.so.preload,localtime,login.defs,machine-id,nsswitch.conf,os-release,passwd,pki,pulse,resolv.conf,ssl,xdg
private-opt QQ

dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop
dbus-user.talk org.freedesktop.portal.Fcitx
dbus-user.talk org.freedesktop.portal.IBus
dbus-user.talk org.freedesktop.ScreenSaver
dbus-user.talk org.gnome.Mutter.IdleMonitor
?ALLOW_TRAY: dbus-user.talk org.kde.StatusNotifierWatcher
ignore dbus-user none

# Redirect
include electron.profile