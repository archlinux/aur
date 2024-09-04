# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=26.2.2336968
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-26.2.0_2336968-linuxRHEL9_gcc11icx232.x86_64.rpm")
b2sums=('bbe2d8288404ee99f88d9f981ab5486549a42a4c8e98300c5aabb9a71ab8895439e17b73fe4cd1781f7029c7d5597f1bfe8eaee4505198b5abc6a5c75156bd4b')

package() {
    mv opt "$pkgdir/"
}

