
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ttf-rubik
pkgver=1.0
pkgrel=0
pkgdesc="Rubik Typeface"
arch=("any")
url="http://hubertfischer.com/work/type-rubik"
license=('custom:OFL')
depends=()
makedepends=()
source=("$pkgname-$pkgver"::'https://fonts.google.com/download?family=Rubik')
sha256sums=('a423f17a4ed912074de62b9f62688e204d3412511c1fb05dd4ef5a95cd7e5ddf')

package() {
	mkdir -p "$pkgdir/usr/share/fonts/TTF/"
	cp "$srcdir/Rubik-"* "$pkgdir/usr/share/fonts/TTF/"
	mkdir -p "$pkgdir/usr/share/licenses/ttf-rubik/"
	cp "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/ttf-rubik/LICENSE"
}
