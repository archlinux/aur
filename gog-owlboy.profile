# Modified steam.profile

# TODO:
#   Fix controller support.

noblacklist ${HOME}/.local/share/Owlboy
noblacklist ${HOME}/.config/Owlboy
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-programs.inc
include /etc/firejail/disable-devel.inc
include /etc/firejail/disable-passwdmgr.inc

caps.drop all
netfilter
nonewprivs
noroot
protocol unix,inet,inet6,netlink
seccomp
