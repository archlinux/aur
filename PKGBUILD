pkgname=terrafirma
pkgver=3.0.5
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=('any')
url='http://seancode.com/terrafirma'
license=(BSD)
depends=()
makedepends=(qt5-base qt5-tools)
source=("https://github.com/mrkite/TerraFirma/archive/$pkgver.tar.gz")
sha256sums=('39979593daf64bbe253dd71dc284008ed1ae124b46135f59ce14bf2ffe0f333e')

build() {
	cd "$srcdir/TerraFirma-$pkgver"
	qmake
	make
}

package() {
	cd "$srcdir/TerraFirma-$pkgver"
	INSTALL_ROOT="$pkgdir" make install
}