.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

pkg:
	makepkg -Asc
