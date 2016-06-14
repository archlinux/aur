#!/bin/sh

inform_user() {
	echo "<INFO> ##########################"
	echo " The package gtk-theme-numix-sx-beta is obsolete!"
	echo " Please install gtk-theme-numix-sx to get the latest updates!"
	echo "<INFO> ##########################"
}

post_install() {
	inform_user
}

post_upgrade() {
	inform_user
}
