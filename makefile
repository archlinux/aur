all:
	rm -rf gmail-tray-*-any.pkg.tar.zst
	makepkg -g
	read -p "Press [Enter] to continue after checking the hashes..."
	makepkg --printsrcinfo > .SRCINFO
	makepkg -fsirc
	sudo pacman -U --noconfirm gmail-tray-*.pkg.tar.zst

commit:
	makepkg -fsirc
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push

