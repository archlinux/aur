# TeamSpeak3
whitelist ${HOME}/Downloads

whitelist ${HOME}/.config/kdeglobals
whitelist ${HOME}/.config/pulse
whitelist ${HOME}/.config/user-dirs.locale

whitelist ${HOME}/.ts3client
whitelist ${HOME}/.nv

noblacklist /run/firejail
noblacklist /run/user
blacklist /run/.*
blacklist /run/*

noblacklist /opt/teamspeak3
blacklist /opt/.*
blacklist /opt/*

blacklist /boot
blacklist /mnt
blacklist /root
blacklist /srv

caps.drop all
seccomp
protocol unix,inet,inet6
netfilter
noroot

include /etc/firejail/whitelist-common.inc
include /etc/firejail/disable-mgmt.inc
include /etc/firejail/disable-secret.inc
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-devel.inc
