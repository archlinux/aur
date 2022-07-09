# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=24.4.2226589
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-24.4.0_2226589-linuxRHEL7_gcc63icc190.x86_64.rpm")
sha256sums=('47f20247493ddc61ea33edf86d60d1414b249ffcf024d4741dbc571bbf705500')

package() {
    mv opt $pkgdir/
}

