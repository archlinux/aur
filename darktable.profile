whitelist ${HOME}/.config/Trolltech.conf
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.kde4
whitelist ${HOME}/.themes
whitelist ${HOME}/.config/darktable/
whitelist ${HOME}/.cache/darktable/
blacklist /boot
blacklist /media
blacklist /mnt
blacklist /opt
whitelist ${DOWNLOADS}
whitelist ${HOME}/Images

blacklist /boot
blacklist /media
blacklist /mnt
blacklist /opt
private-dev
private-etc fonts,X11,alternatives
#private-bin darktable
noexec ${HOME}
noexec /tmp
shell none
seccomp
caps.drop all
noroot
net none
nogroups
nosound
ipc-namespace