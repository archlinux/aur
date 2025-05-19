# Maintainer: Massimo Pavoni <real.damax@gmail.com>

pkgname=ttf-uiua386
pkgver=0.16.0
pkgrel=0
pkgdesc="Uiua font with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT')
source=(
	"https://github.com/uiua-lang/uiua/raw/$pkgver/src/algorithm/Uiua386.ttf"
)
sha256sums=(
	"002735e28e2264ebb83087d9f342726cfa2d8dc1cae56d8139444bca4f44157d"
)

package() {
	install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
}
