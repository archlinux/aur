# Maintainer: Cody Schafer <dev at codyps.com>
pkgname=ioztat
pkgver=2.0.1
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
sha384sums=('521a1db6b7ad8a2fd7ff5635ac5025f0dad673574bc2f042d6499d39dd56ae5939c681d524cc7f38fb2fb237db420558')

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 ioztat "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man8"
	install -m644 ioztat.8 "$pkgdir/usr/share/man/man8"
}
