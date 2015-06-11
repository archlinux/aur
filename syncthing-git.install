#!/bin/bash

post_install() {
	systemctl daemon-reload

cat << EOF
  WebGUI can be accessed at http://localhost:8080

  To start syncthing, execute:

    systemctl start syncthing@user

  where 'user' is your username.

  To autostart syncthing on system start, execute

    systemctl enable syncthing@user

  where 'user' is your username.

EOF
}

post_upgrade() {
	systemctl daemon-reload
}

post_remove() {
	systemctl daemon-reload
}
