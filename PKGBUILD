# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-medio
pkgdesc='Elegant serif font by dot-colon inspired by Didot and Bodoni'
url=https://dotcolon.net/fonts/medio/
pkgver=0.200
pkgrel=1
arch=(any)
license=(CC0-1.0)
source=("$pkgname-$pkgver.zip::https://dotcolon.net/files/fonts/medio_${pkgver//./}.zip")
sha256sums=('1597610c7fa4f16d9863ed88c0607c665c11273079c9d28b9c898f619fbff094')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
