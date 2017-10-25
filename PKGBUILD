# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Maintainer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=8.8.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('669e0054a25c7f21e6d8bef182da566de35fb3b3441e8f90b6da9585c1f82caf')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
