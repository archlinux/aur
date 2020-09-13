# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>

pkgname=nodejs-docs
pkgver=14.10.1
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('5047c4962012f88258d8c1c6c133d870fd818ed5ea0f194ab3aa206510d144ae')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -ar ./doc/api $pkgdir/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4:
