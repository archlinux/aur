# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-seshat
pkgdesc='Roman serif body font by dot-colon that resembles Optima'
url=https://dotcolon.net/fonts/seshat/
pkgver=0.100
pkgrel=1
arch=(any)
license=(CC0-1.0)
source=("$pkgname-$pkgver.zip::https://dotcolon.net/files/fonts/seshat_${pkgver//./}.zip")
sha256sums=('cad99de1e6755f1720c63b6fd37f23b87f3284ae8728271b62e48d9420c1140f')

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
}
