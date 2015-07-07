# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=daa2iso
pkgver=0.1.7e
pkgrel=3
pkgdesc="Converts DAA files (used by PowerISO) to ISO"
arch=('i686' 'x86_64')
url="http://aluigi.altervista.org/mytoolz.htm"
license=('GPL')
source=("http://dl.dropbox.com/u/24716740/mirror/$pkgname.zip")
md5sums=('6930ebcd8568e8ade0a175352d4a3481')

build() {
	cd "$srcdir/src"
	make
}

package() {
	install -Dm 755 "$srcdir/src/daa2iso" "$pkgdir/usr/bin/daa2iso"
}
