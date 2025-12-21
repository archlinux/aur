# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio-bin
pkgver=29.2.9
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha512sums=('aff10907cc570be874e0475304904ac15718314c80935d58223755348cfa1cedb40317ef517371e9d3ccf8026fe2c1c2d328c30adc9951209caa4b2a58110282')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}
