# Maintainer: Philip Goto <philip.goto@gmail.com>
pkgname=cliqr
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line QR code generator"
arch=('x86_64')
url="https://github.com/flipflop97/cliqr"
license=('Creative Commons Attribution-ShareAlike 4.0 International Public License')
depends=('qrencode')
provides=('cliqr')
source=("${pkgname}::https://github.com/flipflop97/cliqr/releases/download/v${pkgver}/cliqr")
sha256sums=('6dd03ab1388234b3b47cb23285157ef49798a62cca17966b5531c8619f3dfbfc')

package() {
    install -dm 755 "${pkgdir}/usr/bin"
    install -m 755 "cliqr" "${pkgdir}/usr/bin"
}
