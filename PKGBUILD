# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=24.3.2208291
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=24.3.2208291'
         'houdini')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=(
    'manual://RenderManForHoudini-py3-24.3_2208291-linuxRHEL7_gcc63icc190.x86_64.rpm'
    'manual://RenderManForHoudini-24.3_2208291-linuxRHEL7_gcc63icc190.x86_64.rpm'
)
sha256sums=(
    'f55b3caacadfe69f901590d980bfa234b174507a3f332389f7b8807b589fe657'
    '76aae5bdeac1eb5774ded726f9009e8fcb3315bba20fe9f858467c6a02b9c1b6'
)

package() {
    mv opt $pkgdir/
}
