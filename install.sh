_pkgname=libinput-gestures

post_install() {
	echo -ne "\e[34;1m"
	echo -e "=== INSTALLATION NOTES for $_pkgname ==="
	echo -ne "\e[39;1m"
	echo -e "You must be a member of the input group, i.e.run:"
	echo -e "   sudo gpasswd -a \$USER input"
	echo -e "Start $_pkgname from DE, or run:"
	echo -e "   $_pkgname-setup start"
	echo -e "To enable auto start of $_pkgname run:"
	echo -e "   $_pkgname-setup autostart"
	echo -e "Configuration files are at:"
	echo -e "   /etc/$_pkgname.conf (system wide default)"
	echo -e "   \$HOME/.config/$_pkgname.conf (optional per user)"
	echo -ne "\e[0m"
}
