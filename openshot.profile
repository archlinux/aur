# Blacklist/Whitelist

blacklist /usr/local/bin
blacklist /usr/local/sbin
blacklist /media
blacklist /mnt
blacklist /boot

# I use Downloads as my data transfer directory
whitelist ${HOME}/Downloads/
whitelist ${HOME}/Videos/

# Config files
whitelist ${HOME}/.openshot/
whitelist ${HOME}/.gtkrc-2.0
# My GTK 2.0 config is in two files
# whitelist ${HOME}/.gtkrc.mine

private-bin openshot,python,dbus-launch
private-tmp

noroot
protocol unix
shell none
seccomp
caps.drop all
