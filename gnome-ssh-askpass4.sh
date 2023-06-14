#
# /etc/profile.d/gnome-ssh-askpass4
#

if [ -f "/usr/lib/ssh/gnome-ssh-askpass4" ] ; then
  SSH_ASKPASS="/usr/lib/ssh/gnome-ssh-askpass4"
  export SSH_ASKPASS
fi

# /etc/profile.d/gnome-ssh-askpass4 ends here.
