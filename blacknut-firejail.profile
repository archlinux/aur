include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc

apparmor
caps.drop all

nodbus
nodvd
nogroups
nonewprivs

noroot
notv
nou2f
novideo

protocol unix,inet,inet6
seccomp

shell none

disable-mnt
private-dev
private-tmp
private-cache
private-etc alsa,alternatives,asound.conf,ca-certificates,fonts,group,localtime,passwd,pulse,resolv.conf

# Can be used for keeping Blacknut logs (you need to comment private-tmp first)
#whitelist /tmp/.X11-unix
#mkdir /tmp/blacknut
#whitelist /tmp/blacknut

# Allow Blacknut to save its configuration
mkdir ${HOME}/.config/Blacknut
whitelist ${HOME}/.config/Blacknut

# Allow access to Pulseaudio configuration
whitelist ${HOME}/.config/pulse
