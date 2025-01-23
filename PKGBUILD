# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio-bin
pkgver=26.0.7
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha512sums=('a99364587ca3ab40bcc526fec8041fc67176173c52d3c2ce17723a642dca68289720f57b6bf7f452216096a05e8f64365a73b76a12ce38d11b6050c7f335cff8')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}
