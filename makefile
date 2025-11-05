all:
	rm -rf gmail-tray-*-any.pkg.tar.zst
	makepkg -fsirc
	sudo pacman -U --noconfirm gmail-tray-*-any.pkg.tar.zst

commit:
	git remote set-url --add --push origin ssh://aur@aur.archlinux.org/gmail-tray.git
	git remote set-url --add --push github git@github.com:maykonmarcosjuniordev-star/gmail-tray.git
	git remote -v
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push
