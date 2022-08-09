# Firejail profile for Dreamfinity
# Description: Dreamfinity is a minecraft servers project.
# This file is overwritten after every install/update
# Persistent local customizations
include dreamfinity.local
# Persistent global definitions
include globals.local

# Idk what it executes in these directories
ignore noexec ${HOME}
ignore noexec /tmp

noblacklist ${HOME}/.minecraftlauncher/Dreamfinity
# TODO these don't work
# ignore blacklist ${PATH}/sh
# noblacklist ${PATH}/sh


include allow-java.inc

# Disable HWID collection
blacklist /sys

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-proc.inc
include disable-programs.inc
# TODO either fix noblacklist or compile dreamfinity to binary (so that it doesn't need shell at all)
# include disable-shell.inc
include disable-xdg.inc

mkdir ${HOME}/.minecraftlauncher/Dreamfinity
whitelist ${HOME}/.minecraftlauncher/Dreamfinity
include whitelist-common.inc

apparmor
caps.drop all
machine-id
nodvd
protocol unix,inet,inet6

disable-mnt
private-dev
private-opt Dreamfinity
private-tmp

# If you're came here with an idea to ignore these to allow launcher to place game files in another directory, STOP
# Add this to your dreamfinity.local: 
# noblacklist /path/to/game/files
# read-write /path/to/game/files
# whitelist /path/to/game/files
#
# Also consider using symlinks as launcher won't move settings.bin (because it stores selected directory there)
read-only ${HOME}
read-write ${HOME}/.minecraftlauncher/Dreamfinity
