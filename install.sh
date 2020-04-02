_pkgname=cdhist

post_install() {
	echo -ne "\e[34;1m"
	echo "=== INSTALLATION NOTES for $_pkgname ==="
	echo -ne "\e[39;1m"
	echo "Users should add \"source /usr/share/cdhist/$_pkgname.bashrc\" to their \$HOME/.bashrc."
	echo -ne "\e[0m"
}
