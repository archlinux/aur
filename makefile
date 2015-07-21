.ONESHELL:

DIR=cicada-master
PKG=cicada

all:
	@
	make build &&\
	make ball
build:
	@
	makepkg -sf

ball:
	@
	mkaurball -f

install:
	@
	pacman -U $(PKG)-*.pkg.tar.xz

clean*~:
	@
	rm -f *~ */*~ */*/*~ */*/*/*~ */*/*/*/*~  */*/*/*/*/*~

clean*.bin:
	@
	rm -f *.bin */*.bin */*/*.bin */*/*/*.bin */*/*/*/*.bin	 */*/*/*/*/*.bin

clean:
	@
	make clean*~
	make clean*.bin
	rm $(PKG)-*.pkg.tar.xz
	rm $(PKG)-*.src.tar.gz
	rm -rf *.zip
	rm -rf src
	rm -rf pkg
	rm -rf $(DIR)
	echo -e "\e[33;1m [ok] clean directory \e[0m"
