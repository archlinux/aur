private-bin luminance-hdr,luminance-hdr-cli,align_image_stack
private-dev
private-etc fonts,X11,alternatives
whitelist /tmp/.X11-unix

whitelist ${HOME}/Pictures
whitelist ${HOME}/Downloads
whitelist ${HOME}/.LuminanceHDR
whitelist ${HOME}/.config/Luminance

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