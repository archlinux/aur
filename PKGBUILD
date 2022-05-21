# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

pkgname=plzip-lzip-link
pkgver=1
pkgrel=1
pkgdesc="A symlink from plzip to lzip for those who always want to compress lzip multithreaded."
arch=('any')
license=('GPL')
depends=('plzip')
provides=('lzip')
conflicts=('lzip')

package() {
	mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/bin/plzip "$pkgdir/usr/bin/lzip"
}
