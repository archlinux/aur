whitelist ${DOWNLOADS}
whitelist ${HOME}/Images
whitelist ${HOME}/Videos

private-bin blender
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