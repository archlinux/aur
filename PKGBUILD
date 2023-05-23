# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=20.2.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('cd1b0eb67fffe83112034fbdc64b363287e017f835251702f041982633e4b6aa')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs/html
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/html/
}
# vim:set ts=4 sw=4 et:
