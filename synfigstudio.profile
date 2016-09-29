whitelist ${DOWNLOADS}
whitelist ${HOME}/.synfig

private-bin synfigstudio
private-etc fonts,X11,synfig
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