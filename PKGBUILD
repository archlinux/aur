# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=unyaffs
pkgver=2008.10
pkgrel=1
pkgdesc="S program to extract files from a yaffs image"
arch=("i686" "x86_64")
url="http://code.google.com/p/unyaffs/"
license=(GPL3)

source=("http://unyaffs.googlecode.com/files/$pkgname.c" "http://unyaffs.googlecode.com/files/$pkgname.h")

md5sums=('aa4a8b3572c73d1c79277af6f52de9f9'
         'b51ee3038a6232c1f84aeb2b94cc8600')

build() {
	gcc -o "$srcdir/unyaffs" "$srcdir/unyaffs.c"
	install -D -m 0755 "$srcdir/unyaffs" "$pkgdir/usr/bin/unyaffs" 
}
