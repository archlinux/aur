#
# /etc/profile.d/ssh-askpass-fullscreen.sh
#
# Maintained by Philipp Robbel <robbel@gmail.com>

if [ -f "/usr/lib/openssh/ssh-askpass-fullscreen" ] ; then
  SSH_ASKPASS="/usr/lib/openssh/ssh-askpass-fullscreen"
  export SSH_ASKPASS
fi
