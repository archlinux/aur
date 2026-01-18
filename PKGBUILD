# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-nacelle
pkgdesc='Neo-grotesque sans-serif font by dot-colon that refines the design of Aileron'
url=https://dotcolon.net/fonts/nacelle/
pkgver=1.00
pkgrel=1
arch=(any)
license=(OFL-1.1)
source=("$pkgname-$pkgver.zip::https://dotcolon.net/files/fonts/nacelle_${pkgver//./}.zip")
sha256sums=('4e21fc1e22b15c4e1a7c520cf48ec5d47a5803beee21ac7edc0b205c340a4065')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
