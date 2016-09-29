whitelist ${HOME}/.config/Brackets
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.themes
whitelist ${DOWNLOADS}
whitelist ${HOME}/Documents

whitelist /opt/brackets/
whitelist /opt/google/

private-bin bash,brackets,readlink,dirname,google-chrome,cat
private-dev
whitelist /tmp/.X11-unix

# Comment out or use --ignore=net if you want to install extensions or themes
net none

# Disable these if you use live preview (until I figure out a workaround)
# Doing so should be relatively safe since there is no network access
seccomp
noroot
caps.drop all