all: clean main lint install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf himawaripy
	rm -Rf himawaripy-git-*.pkg.tar.xz

lint:
	namcap PKGBUILD
	namcap himawaripy-git-*.pkg.tar.xz

main:
	makepkg
	mksrcinfo

install:
	sudo pacman -U himawaripy-git-*.pkg.tar.xz
