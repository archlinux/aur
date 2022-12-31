include tencent-qq.local
# Persistent global definitions
include globals.local

noblacklist ${HOME}/.config/QQ

# Allow opening hyperlinks
include allow-bin-sh.inc

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-shell.inc
include disable-xdg.inc

mkdir ${HOME}/.config/QQ
whitelist ${HOME}/.config/QQ
whitelist ${DOWNLOADS}
include whitelist-common.inc
include whitelist-runuser-common.inc
include whitelist-usr-share-common.inc
include whitelist-var-common.inc

apparmor
caps.drop all
netfilter
nodvd
noinput
nonewprivs
noroot
notv
protocol unix,inet,inet6,netlink
seccomp !chroot
seccomp.block-secondary
shell none

disable-mnt
# TODO: https://github.com/BeautyYuYanli/linuxqq-new-firejail/issues/1#issuecomment-1368246014
# private-bin bash,sh,tencent-qq,xdg-open
private-cache
private-dev
private-etc alsa,alternatives,ca-certificates,crypto-policies,fonts,group,ld.so.cache,ld.so.preload,localtime,machine-id,os-release,passwd,pki,pulse,resolv.conf,ssl,xdg
private-opt QQ
private-tmp

dbus-user filter
dbus-user.talk org.freedesktop.Notifications
?ALLOW_TRAY: dbus-user.talk org.kde.StatusNotifierWatcher
dbus-user.talk org.gnome.Mutter.IdleMonitor
dbus-user.talk org.freedesktop.ScreenSaver
dbus-system none
