# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>

pkgname=nodejs-docs
pkgver=19.0.1
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('6524eb35e1b3c1fc128f9fb6c9ecd92aaba64261fa411aeec6a193019791a51b')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs/html
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/html/
}
# vim:set ts=4 sw=4 et:
