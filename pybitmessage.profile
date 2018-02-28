# Firejail profile for PyBitmessage
# This file is overwritten after every install/update
# Persistent local customizations
include /etc/firejail/pybitmessage.local
# Persistent global definitions
include /etc/firejail/globals.local

noblacklist ${HOME}/.config/PyBitmessage
noblacklist ${HOME}/PyBitmessage/src/bitmessagemain.py

include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-passwdmgr.inc
include /etc/firejail/disable-programs.inc

mkdir ~/.config/PyBitmessage
whitelist ~/.config/PyBitmessage
include /etc/firejail/whitelist-common.inc

caps.drop all
netfilter
no3d
nodvd
nogroups
nonewprivs
noroot
notv
novideo
protocol unix,inet,inet6
seccomp
shell none

disable-mnt
private-dev
private-bin pybitmessage,python,python2,python2.7,sh,ldconfig
private-tmp

noexec ${HOME}
noexec /tmp
