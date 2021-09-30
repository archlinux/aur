# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>

pkgname=nodejs-docs
pkgver=16.10.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('69b09bb0c4cd9add7eb501b1625a405b15d6ce53596e98b863c8d066e0b6b202')

package() {
	cd "node-v${pkgver}"
	install -d ${pkgdir}/usr/share/doc/nodejs
	cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4:
