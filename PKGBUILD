# Contributor: wodim <neikokz@gmail.com>

pkgname=xorsearch
pkgver=1.6.0
pkgrel=1
pkgdesc="Program to search for a given string in an XOR, ROL or ROT encoded binary file."
arch=('i686' 'x86_64')
url="http://blog.didierstevens.com/programs/xorsearch/"
license="Public domain"
source=('http://www.didierstevens.com/files/software/XORSearch_V1_6_0.zip')
md5sums=('F672F95F49DD72ECCF93D1779BB0EBCC')

build() {
	cd $startdir/src
	gcc -o xorsearch XORSearch.c
}

package() {
	cd $pkgdir

	mkdir usr/bin -p
	cp -r $srcdir/xorsearch usr/bin
}
