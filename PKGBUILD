# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=24.7.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('5ce2df7022d027d439b289e7393e04c494e92dec53aba212781b5f792015138a')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs/html
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/html/
}
# vim:set ts=4 sw=4 et:
