# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=unyaffs
pkgver=2008.10
pkgrel=2
pkgdesc="A program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="http://code.google.com/p/unyaffs/"
license=(GPL3)

source=("http://unyaffs.googlecode.com/files/$pkgname.c" "http://unyaffs.googlecode.com/files/$pkgname.h")

sha256sums=('82b28c82d9e56d3ea1c082c42bf3fac49169b7646de0f9c58f989d09ffb4636b'
            'cd421a9abb8ed02e33db06578184b95a25547eb343084987109c235e9e1a9e47')

build() {
	gcc -o "$srcdir/unyaffs" "$srcdir/unyaffs.c"
}

package() {
	install -D -m 0755 "$srcdir/unyaffs" "$pkgdir/usr/bin/unyaffs"
}
