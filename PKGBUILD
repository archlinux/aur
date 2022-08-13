# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=18.7.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('7dcf86ccd6831032531bcbec0cdcc993f9997bba2f53f6d29c72603ea69285ba')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4 et:
