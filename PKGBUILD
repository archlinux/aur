# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>

pkgname=nodejs-docs
pkgver=16.11.1
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('8b5a54b284e524984772d34dc2efc68a10fc2f91db11390c6035ef2a9509ef2c')

package() {
	cd "node-v${pkgver}"
	install -d ${pkgdir}/usr/share/doc/nodejs
	cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4:
