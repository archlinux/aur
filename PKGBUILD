# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=nodejs-docs
pkgver=7.2.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
source=("https://nodejs.org/dist/v$pkgver/node-v$pkgver.tar.gz")
md5sums=('ea2dd2de3e93b601f576bf24c1ab56ec')

package() {
	cd "node-v$pkgver"
	install -d $pkgdir/usr/share/doc/nodejs
	cp -a ./doc/api/* $pkgdir/usr/share/doc/nodejs/
}
