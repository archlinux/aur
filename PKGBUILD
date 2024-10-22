# Maintainer: Massimo Pavoni <real.damax@gmail.com>

pkgname=ttf-uiua386
pkgver=0.13.0
pkgrel=0
_colorCommit=62fa5e1befaf9e12c31a012eb25ceab91e811ed3
pkgdesc="Uiua fonts with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT AND Unlicense')
source=(
	"https://github.com/uiua-lang/uiua/raw/$pkgver/src/algorithm/Uiua386.ttf"
	"https://github.com/jonathanperret/uiua386color/raw/$_colorCommit/Uiua386Color.ttf"
)
sha256sums=(
	"55e53741932a7e879827a23ac42bf89c808282918e47f86fb2979c1852beafba"
	"54d81bfb1c0db7809d76edd47048dd3b3f210a3e1338d074f80e57c01462e8be"
)

package() {
	install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
	install -Dm644 "$srcdir/Uiua386Color.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386Color.ttf"
}
