# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com> 
pkgname=janus
pkgver=0.9.3
pkgrel=1
pkgdesc=" Simple gtk notepad written in C "
url="https://github.com/gholmann16/janus"
arch=('x86_64')
license=('GPL3')
depends=('gtk3' 'gtksourceview4')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f59107b06e8f7de85316277867ebad533d85160093ebaf4063e23307fa45a823')
build() {
	cd "Janus-$pkgver"
	make release
}

package() {
	cd "Janus-$pkgver"
	make install DESTDIR=${pkgdir}
}
