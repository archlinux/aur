all:
	makepkg -fsirc
	sudo pacman -U gmail-tray-2.0-1-any.pkg.tar.zst

commit:
	git remote set-url --add --push origin ssh://aur@aur.archlinux.org/gmail-tray.git
	git remote set-url --add --push github git@github.com:maykonmjunior/gmail-tray.git
	git remote -v
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push
