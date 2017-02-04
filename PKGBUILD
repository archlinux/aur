pkgname=terrafirma
pkgver=3.0.18
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('e309ae7cbc691dd737e51ec3e1bf6d153fb8bac8ccef9181df66eb883e416d97')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}
