#!/bin/sh

post_install() {
  cat << EOF
==> An executable at /usr/bin/i3bar-icons has been installed

To use this do the following:
- in your i3 config in the bar section add:
    i3bar_command  /usr/bin/i3bar-icons
- Set up i3bar to receive json strings specifying the icons
  you want to view

EOF
}

post_upgrade() {
  post_install $1
}
