#!/bin/sh

post_install() {
	echo ">>> You will need a Web Server to use this package"
	touch /srv/http/cmsmadesimple/config.php
	chmod 664 /srv/http/cmsmadesimple/config.php
}

post_upgrade() {
	echo ">>> You will need a Web Server to use this package"
}
