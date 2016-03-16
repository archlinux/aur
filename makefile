all: clean main lint install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf superpowers
	rm -Rf superpowers*.zip
	rm -Rf *superpowers-*.pkg.tar.xz

lint:
	namcap PKGBUILD
	namcap *superpowers-*.pkg.tar.xz

main:
	makepkg
	mksrcinfo

install:
	sudo pacman -U *superpowers-*.pkg.tar.xz
