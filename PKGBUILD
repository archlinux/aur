# Maintainer: Javad <ja7ad@live.com>

pkgname=drawio-live-bin
pkgver=29.3.6
pkgrel=1
pkgdesc="Diagram drawing application built on web technology (Live version)"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}

sha256sums=('0a00e7a70902ea4b8bb1b7e6c46b05fff1825d4362b5f7817e1649e8cd61952b')