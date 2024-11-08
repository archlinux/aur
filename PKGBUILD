# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributer: Radu Potop <radu at wooptoo com>
pkgname=nodejs-docs
pkgver=23.1.0
pkgrel=1
pkgdesc="Node.js API documentation."
arch=(any)
url="https://nodejs.org/en/docs/"
license=('MIT')
options=('docs')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.gz")
sha256sums=('4ccf155c703d53caf4e56624004782f106fce2b6935496b3ff29c6da4d6b6674')

package() {
    cd "node-v${pkgver}"
    install -d ${pkgdir}/usr/share/doc/nodejs/html
    cp -r doc/api ${pkgdir}/usr/share/doc/nodejs/html/
}
# vim:set ts=4 sw=4 et:
