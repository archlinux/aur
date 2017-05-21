
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ttf-contemporary
pkgver=2.0
pkgrel=0
pkgdesc="Contemporary Typeface"
arch=("any")
url="http://vicr123.github.io/contemporary"
license=('custom:OFL')
depends=()
makedepends=()
source=("$pkgname-$pkgver"::'https://vicr123.github.io/typeface/contemporary.zip')
sha256sums=('SKIP')

package() {
	mkdir -p "$pkgdir/usr/share/fonts/TTF/"
	cp "$srcdir/Contemporary-"* "$pkgdir/usr/share/fonts/TTF/"
	mkdir -p "$pkgdir/usr/share/licenses/ttf-contemporary/"
	cp "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/ttf-contemporary/LICENSE"
}
