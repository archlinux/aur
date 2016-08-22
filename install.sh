_pkgname=cdhist

post_install() {
	echo -ne "\e[34;1m"
	echo "=== INSTALLATION NOTES for $_pkgname ==="
	echo -ne "\e[39;1m"
	echo "Users should source /etc/$_pkgname.bashrc into \$HOME/.bashrc"
	echo -ne "\e[0m"
}
