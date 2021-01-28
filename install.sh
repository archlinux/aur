#!/bin/bash

post_install() {
	echo 'You need to edit /opt/boardy-server/ServerConfig.json with your phone'\''s SSH info,'
	echo 'and then run `systemctl --user enable --now BoardyServer` to start the server!'
}

post_upgrade() {
	echo 'Ensure your /opt/boardy-server/ServerConfig.json was not overriden,'
	echo 'and then restart the server with `systemctl --user restart BoardyServer`!'
}