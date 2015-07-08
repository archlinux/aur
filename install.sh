post_install() {
	cat <<- EOF
		==> Infinality environment variables are located in the file /etc/profile.d/infinality-settings.sh. Change it according to your taste.
		==> Fontconfig files have moved to fontconfig-infinality package which should be installed and configured separately.
		==> For best experience, install either Windows, Apple or Google fonts.	More information is available at http://www.infinality.net.
	EOF
}

post_upgrade() {
	post_install $0
}
