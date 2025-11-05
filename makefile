all:
	rm -rf gmail-tray-*-any.pkg.tar.zst
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fsirc
	sudo pacman -U --noconfirm gmail-tray-*-any.pkg.tar.zst

add:
	git remote add origin ssh://aur@aur.archlinux.org/gmail-tray.git
	git remote add github git@github.com:maykonmarcosjuniordev-star/gmail-tray.git

commit:
# 	git remote set-url --push origin ssh://aur@aur.archlinux.org/gmail-tray.git
# 	git remote set-url --add --push github git@github.com:maykonmarcosjuniordev-star/gmail-tray.git
# 	git remote -v
	makepkg -fsirc
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push

