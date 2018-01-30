all: clean main lint install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf slinger
	rm -Rf *slinger-git-*.pkg.tar.xz

lint:
	namcap PKGBUILD
	namcap *slinger-git-*.pkg.tar.xz

main:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

install:
	sudo pacman -U *slinger-git-*.pkg.tar.xz
