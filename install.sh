post_install() {
	echo "Initializing OwnTracks database..."
	ot-recorder --initialize
}

post_upgrade() {
	echo "Upgrading OwnTracks database..."
	ot-recorder --initialize
}
