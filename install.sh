_pkgname=arch-upgrade

post_install() {
	echo -ne "\e[34;1m"
	echo "=== INSTALLATION NOTES for $_pkgname ==="
	echo -ne "\e[39;1m"
	echo "Configuration files are at:"
	echo "   /etc/$_pkgname.conf (system wide default)"
	echo "   \$HOME/.config/$_pkgname.conf (optional per user)"
	echo -ne "\e[0m"
}
