# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>

pkgname=nodejs-docs
pkgver=16.1.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('cdc229fff0e18ff9ca29c057691ff29da7bee8b7107b72d8181bdb5c3eeaba00')

package() {
	cd "node-v${pkgver}"
	install -d ${pkgdir}/usr/share/doc/nodejs
	cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4:
