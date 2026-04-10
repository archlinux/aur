# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ttf-midori
pkgdesc='Semi-condensed sans-serif font intended for user interfaces'
pkgver=0.4
pkgrel=1
url=http://www.altsan.org/creative/fonts/midori
arch=(any)
license=(OFL-1.1)
source=("$url/midori_ttf_${pkgver//./}.zip")
sha256sums=('79e1a09a378d9da69c52aa895288a2b34582021694a6d81265202a1202f61471')

build () {
	:
}

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts" "$srcdir"/midori{,b}.ttf
}
