include va-11-hall-a-gog.local
include globals.local

# VA-11 Hall-A configuration folders
noblacklist ${HOME}/.config/VA_11_Hall_A
mkdir ${HOME}/.config/VA_11_Hall_A
whitelist ${HOME}/.config/VA_11_Hall_A

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
private-opt va-11-hall-a-gog
private-tmp

dbus-user none
dbus-system none
