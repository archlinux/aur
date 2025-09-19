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
	ssh-add ~/.ssh/arch/arch
	git push origin master   # AUR
	ssh-add ~/.ssh/id_ed25519
	git push github main   # GitHub

