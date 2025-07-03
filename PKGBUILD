# Maintainer: David Grisham <dmgrisham@gmail.com>
pkgname=bbmp-bin
pkgver=v0.1.4
pkgrel=1
pkgdesc="Based Black Music Player"
arch=(x86_64)
url="https://github.com/dgrisham/bbmp"
license=('GPL')
source=("https://grish.haus/bin/bbmp/${pkgver}/bbmp")
depends=()
sha256sums=('7f455328abb1719e75d569864bf339bbe107953a87a88fdd0e1a545a2ea88760')

package() {
	install -Dm0755 "$srcdir/bbmp" "$pkgdir/usr/bin/bbmp"
}
