# Maintainer: Massimo Pavoni <real.damax@gmail.com>

pkgname=ttf-uiua386
pkgver=0.17.1
pkgrel=0
pkgdesc="Uiua font with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT')
source=(
	"https://github.com/uiua-lang/uiua/raw/$pkgver/src/algorithm/Uiua386.ttf"
)
sha256sums=(
	"7f2d6ab69cec6df3de7dd0ff0ff4667fb04669b3827e6b7db11f9d6f1b9aa60d"
)

package() {
	install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
}
