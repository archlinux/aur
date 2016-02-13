all: clean main install

clean:
	rm -Rf pkg
	rm -Rf src
	rm -Rf shellshape
	rm -Rf *shellshape-git-*.pkg.tar.xz

main:
	makepkg
	mksrcinfo

install:
	sudo pacman -U *shellshape-git-*.pkg.tar.xz
