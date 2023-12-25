# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=25.2.2282810
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-25.2.0_2282810-linuxRHEL7_gcc93icc219.x86_64.rpm")
sha256sums=('066167a239b306ee624b0d737cca210b813400c12a32038a6457e267eab9d34c')

package() {
    mv opt "$pkgdir/"
}

