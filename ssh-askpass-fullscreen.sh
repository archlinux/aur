#
# /etc/profile.d/ssh-askpass-fullscreen.sh
#

if [ -f "/usr/lib/openssh/ssh-askpass-fullscreen" ] ; then
  SSH_ASKPASS="/usr/lib/openssh/ssh-askpass-fullscreen"
  export SSH_ASKPASS
fi
