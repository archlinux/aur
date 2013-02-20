# Contributor: wodim <neikokz@gmail.com>

pkgname=xorsearch
pkgver=1.8.0
pkgrel=1
pkgdesc="Program to search for a given string in an XOR, ROL or ROT encoded binary file."
arch=('i686' 'x86_64')
url="http://blog.didierstevens.com/programs/xorsearch/"
license="Public domain"
source=('http://www.didierstevens.com/files/software/XORSearch_V1_8_0.zip')
md5sums=('0c252edebc85d8f0f9ddb8d1aa11e12e')

build() {
	cd $startdir/src
	gcc -o xorsearch XORSearch.c
}

package() {
	cd $pkgdir

	mkdir usr/bin -p
	cp $srcdir/xorsearch usr/bin
}
