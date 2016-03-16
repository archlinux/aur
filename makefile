all: clean main lint install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf mocha
	rm -Rf mocha*.tgz
	rm -Rf *mocha-*.pkg.tar.xz

lint:
	namcap PKGBUILD
	namcap *mocha-*.pkg.tar.xz

main:
	makepkg
	mksrcinfo

install:
	sudo pacman -U *mocha-*.pkg.tar.xz
