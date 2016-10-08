whitelist ${HOME}/Videos
whitelist ${HOME}/.config/GREYC/
private-bin zart,ffmpeg,melt,ffprobe,ffplay
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