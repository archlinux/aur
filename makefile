all: clean main lint install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf npm-check-updates
	rm -Rf npm-check-updates*.tgz
	rm -Rf *npm-check-updates-*.pkg.tar.xz

lint:
	namcap PKGBUILD
	namcap *npm-check-updates-*.pkg.tar.xz

main:
	makepkg
	mksrcinfo

install:
	sudo pacman -U *npm-check-updates-*.pkg.tar.xz
