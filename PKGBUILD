# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=24.2.2199188
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-24.2.0_2199188-linuxRHEL7_gcc63icc190.x86_64.rpm")
sha256sums=('8b97e66d8fafa1e34552a8715a352d58dc22a98ee01246579d08b82c408c8041')

package() {
    mv opt $pkgdir/
}

