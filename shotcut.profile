whitelist ${DOWNLOADS}
whitelist ${HOME}/Videos
whitelist ${HOME}/.config/Meltytech/
whitelist /opt/shotcut
#private-bin shotcut-bin
private-etc fonts,X11
private-dev
whitelist /tmp/.X11-unix
noexec ${HOME}
noexec /tmp
shell none
noroot
ipc-namespace
net none
seccomp
caps.drop all