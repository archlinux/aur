
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=contemporary-sounds
pkgver=1.0
pkgrel=0
pkgdesc="Contemporary Sounds"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('cc-by-sa-4.0')
depends=()
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/contemporary-sounds.git')
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/sounds/contemporary"
	cp -r "$pkgname-$pkgver/"* "$pkgdir/usr/share/sounds/contemporary/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/sounds/contemporary/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
