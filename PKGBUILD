# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=nodejs-docs
pkgver=7.7.4
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
sha256sums=('d76bad6e843005aa016f285e983493e344fde80eac4258b4bf9ee8654f5d6e43')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
