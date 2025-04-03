# Maintainer: Massimo Pavoni <real.damax@gmail.com>

pkgname=ttf-uiua386
pkgver=0.15.0
pkgrel=0
pkgdesc="Uiua font with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT')
source=(
	"https://github.com/uiua-lang/uiua/raw/$pkgver/src/algorithm/Uiua386.ttf"
)
sha256sums=(
	"2bff9b2d3fcd203f0f90dce1d97e4093a49a7227b6ef080a074f36b3b93b20b6"
)

package() {
	install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
}
