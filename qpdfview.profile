whitelist /tmp/.X11-unix

## Add other whitelisted directories here if desired

whitelist ${DOWNLOADS}
whitelist ${HOME}/Documents

##

whitelist ${HOME}/.config/qpdfview

private-dev
private-etc fonts,X11,alternatives
private-bin qpdfview

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