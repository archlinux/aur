include death-road-to-canada-gog.local
include globals.local

# Death Road to Canada configuration folders
noblacklist ${HOME}/.madgarden/DR2C
mkdir ${HOME}/.madgarden/DR2C
whitelist ${HOME}/.madgarden/DR2C

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
private-opt death-road-to-canada-gog
private-tmp

dbus-user none
dbus-system none
