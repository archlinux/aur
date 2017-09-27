# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=8.6.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('80551d47440c602c5825a3f6611e13cb0c57d277234dbff693af433a88351a08')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
