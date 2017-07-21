# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=8.2.1
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('66fe1379bc7daf9a16c6b5c45ab695bf1cdcfae9738d2989e940104d6b31973f')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
