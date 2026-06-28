# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=drawio-bin
pkgver=30.2.6
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("drawio-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha512sums=('3b39079bdda0707d3a377a48e65fe7c38fd8cb0cbfa4d8337b35f91d35d68766c8b2cbc0b214753513567bc4c17b803486b345cd99ae94645e6f843a1ae42158')

package() {
    install -dm755 "${pkgdir}/usr/share/webapps/drawio"
    cp -r ${srcdir}/* "${pkgdir}/usr/share/webapps/drawio/"
}
