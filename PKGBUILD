# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=17.3.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('2914a3f0dc02ec6046f81ff12e1fb1fcf2b346b6b50e2c944440fdd165efd3ff')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/
}
# vim:set ts=4 sw=4 et:
