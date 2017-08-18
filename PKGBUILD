# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=8.4.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('641a15fa822710ef2dc99793fec48d2a8ef75de0040b86568563d4ab296137ef')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
