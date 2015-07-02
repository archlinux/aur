#
# /etc/profile.d/gnome-ssh-askpass2
#

if [ -f "/usr/lib/ssh/gnome-ssh-askpass2" ] ; then
  SSH_ASKPASS="/usr/lib/ssh/gnome-ssh-askpass2"
  export SSH_ASKPASS
fi

# /etc/profile.d/gnome-ssh-askpass2 ends here.
