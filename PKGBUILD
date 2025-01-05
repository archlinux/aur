# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio-bin
pkgver=26.0.3
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha512sums=('cae52ad82005523731174a641611480e0fc8c992f283382b19b36f6fd889861646910a03eb05d4988bee3c8fd8a60d84ecd8b94dbb7aad5da3d991d01a184146')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}
