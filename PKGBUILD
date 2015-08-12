pkgname=terrafirma
pkgver=3.0.1
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('2c6264c8558067d994a662675fcf7d417954ab35a7e2afde4fe86fa2c510c1c8')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}