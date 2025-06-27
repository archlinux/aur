sha256sums:
	makepkg --geninteg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg -s -f

install:
	makepkg -si