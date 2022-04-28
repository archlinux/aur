include heros-hour-gog.local
include globals.local

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-write-mnt.inc
include disable-xdg.inc

# Disable network access
net none

apparmor
caps.drop all
nodvd
nogroups
noinput
nonewprivs
noroot
notv
nou2f
novideo
seccomp
shell none
tracelog

disable-mnt
private-cache
private-dev
private-etc machine-id
private-opt heros-hour-gog
private-tmp

dbus-user none
dbus-system none
