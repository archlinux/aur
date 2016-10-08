blacklist /usr/local/bin
blacklist /usr/local/sbin
blacklist /boot
blacklist /media
blacklist /mnt
whitelist ${HOME}/.Natron
whitelist ${HOME}/.cache/INRIA/Natron/
whitelist ${HOME}/.config/INRIA/
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.themes
whitelist ${DOWNLOADS}
whitelist ${HOME}/Videos

whitelist /opt/natron/

private-bin natron
private-etc fonts,X11,pulse
whitelist /tmp/.X11-unix/
noexec ${HOME}
noexec /tmp
shell none
ipc-namespace