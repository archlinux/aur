# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio-bin
pkgver=29.6.4
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha512sums=('be5907f733f4ead9193046f987bfc1c22729ad6e2f73f5593ae7d649da900877aa51e363c30e8ce9bdc2cbda1061b3ecb557cc8afe6b3fea2078af49c9219670')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}
