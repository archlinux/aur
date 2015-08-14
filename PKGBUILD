pkgname=terrafirma
pkgver=3.0.4
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('cb7e0fc0d5509964f7a1c67999057abda1dd68a3f028137df6cb54345a21a399')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}