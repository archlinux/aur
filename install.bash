post_install() {
	useradd -b /var/lib -d /var/lib/dtn7 -s /usr/bin/nologin -r dtn7
	chown dtn7:dtn7 /var/lib/dtn7
}

post_remove() {
	userdel dtn7
}