post_install() {
	cat <<- EOF
		==> Infinality fontconfig settings are enabled system-wide by default. If you don't like this, replace the symlink /etc/fonts/conf.d/52-infinality.conf with an empty file - It will be preserved between updates.
		==> Refer to /etc/fonts/infinality/README for available customization options. For best experience, install either Windows, Apple or Google fonts. More information is available at http://www.infinality.net.
	EOF
}

post_upgrade() {
	post_install $0
}
