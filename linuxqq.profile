# Firejail profile for linuxqq
# Description: IM client based on Electron
# This file is overwritten after every install/update
# Persistent local customizations
include linuxqq.local
# Persistent global definitions
include globals.local

# REMINDER: add counterpart `blacklist ${HOME}/.config/QQ` to `disable-programs.inc`
noblacklist ${HOME}/.config/QQ

# Allow opening hyperlinks with Firefox
# profiles access
noblacklist ${HOME}/.mozilla
whitelist ${HOME}/.mozilla
whitelist ${HOME}/.mozilla/firefox/profiles.ini
read-only ${HOME}/.mozilla/firefox/profiles.ini
# shell access
include allow-bin-sh.inc
include disable-shell.inc
# D-Bus access
dbus-user.talk org.mozilla.*

mkdir ${HOME}/.config/QQ
whitelist ${HOME}/.config/QQ
whitelist ${DESKTOP}

ignore apparmor
noprinters

# If you don't need/want to save anything to disk you can add `private` to your linuxqq.local.
#private
# REMINDER: QQ executable name on Debian/Ubuntu is `qq`
# https://github.com/BeautyYuYanli/linuxqq-new-firejail/issues/1#issuecomment-1368366777
# create an alias profile for that and reshuffle private-bin accordingly
private-bin awk,bash,cut,echo,egrep,firefox,fish,gio,grep,head,linuxqq,qq,readlink,sed,sh,tclsh,tr,which,www-browser,xdg-mime,xdg-open,x-www-browser
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