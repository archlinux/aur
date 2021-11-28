# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman-for-houdini
pkgver=24.2.2199188
pkgrel=1
pkgdesc="RenderMan plugin for Houdini"
arch=('x86_64')
url="https://renderman.pixar.com/"
license=('custom')
depends=('renderman=24.2.2199188' 'renderman-pro-server=24.2.2199188'
         'houdini')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the RPM(s) through the renderman package, then disable a source in the PKGBUILD if desired")
source=(
    'manual://RenderManForHoudini-py3-24.2_2199188-linuxRHEL7_gcc63icc190.x86_64.rpm'
    'manual://RenderManForHoudini-24.2_2199188-linuxRHEL7_gcc63icc190.x86_64.rpm'
)
sha256sums=(
    '63ba5ae135419773bfdbab510ffa1f30fe026efca7457b5a44a15e422ac64427'
    'f6087f30ee10f847059737a308849f4f9bf0bbaa15d477528381e49b3ec45d90'
)

package() {
    mv opt $pkgdir/
}
