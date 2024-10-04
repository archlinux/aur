# Maintainer: Massimo Pavoni <real.damax@gmail.com>

pkgname=ttf-uiua386
pkgver=0.12.3
pkgrel=0
_colorCommit=62fa5e1befaf9e12c31a012eb25ceab91e811ed3
pkgdesc="Uiua fonts with language glyphs, inspired by APL386"
arch=(any)
url="https://www.uiua.org/"
license=('MIT AND Unlicense')
source=(
	"https://github.com/uiua-lang/uiua/raw/$pkgver/site/Uiua386.ttf"
	"https://github.com/jonathanperret/uiua386color/raw/$_colorCommit/Uiua386Color.ttf"
)
sha256sums=(
	"4d3b4e10a06e66b6c10702fdf011902b8a6212c2a0f6d81d5f806424a8e22f3c"
	"54d81bfb1c0db7809d76edd47048dd3b3f210a3e1338d074f80e57c01462e8be"
)

package() {
	install -Dm644 "$srcdir/Uiua386.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386.ttf"
	install -Dm644 "$srcdir/Uiua386Color.ttf" "$pkgdir/usr/share/fonts/TTF/Uiua386Color.ttf"
}
