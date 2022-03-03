# Maintainer: Cody Schafer <dev at codyps.com>
pkgname=ioztat
pkgver=2.0.0
pkgrel=1
pkgdesc="storage load analysis tool for OpenZFS"
arch=(any)
url="https://github.com/jimsalterjrs/ioztat"
license=('BSD')
groups=()
depends=()
makedepends=()
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/jimsalterjrs/ioztat/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
md5sums=('e1f02315bc79e7f583f045a9753f53c4')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 ioztat "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man8"
	install -m644 ioztat.8 "$pkgdir/usr/share/man/man8"
}
