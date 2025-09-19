all:
	makepkg -fsirc
	sudo pacman -U gmail-tray-2.0-1-any.pkg.tar.zst

set:
	git remote add github git@github.com:maykonmjunior/gmail-tray.git

commit:
	git remote -v
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push origin master   # AUR
	git push github master   # GitHub

