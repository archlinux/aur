
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-icons
pkgver=1.11
pkgrel=0
pkgdesc="Contemporary Icons"
arch=("any")
url="https://vicr123.com/projects/contemporary/"
license=('cc-by-sa-4.0')
depends=()
makedepends=()
source=("$pkgname-$pkgver"::"https://github.com/theCheeseboard/contemporary-icons/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('217c7bf429954400ac1d20aa2bd2c2fe07263b1ce29d3dd55f49d75ced159140')

package() {
	mkdir -p "$pkgdir/usr/share/icons/contemporary"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/icons/contemporary/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/icons/contemporary/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
