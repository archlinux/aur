# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=24.4.2226589
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman-pro-server=24.4.2226589'
         'houdini')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=(
    'manual://RenderManForHoudini-py3-24.4_2226589-linuxRHEL7_gcc63icc190.x86_64.rpm'
    'manual://RenderManForHoudini-24.4_2226589-linuxRHEL7_gcc63icc190.x86_64.rpm'
)
sha256sums=(
    'e68c0c7e6723bb8cb0741a9e8d20508c4d24fb06e49f41be93bb3d6802635877'
    '5886912cb28ccba7a69e8bd58466f9e647824c4a1d5b77317c79ca7d901bad6e'
)

package() {
    mv opt $pkgdir/
}
