# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=26.0.0_2323370
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-26.0.0_2323370-linuxRHEL7_gcc93icx232.x86_64.rpm")
b2sums=('8427b27b158624c7076284ec46260f64d11910b518e75e1051e0d40f24347cdd178c2eb477a7c31a4eedb46d0eb504766908d538839d91fc299017e4c9b17542')

package() {
    mv opt "$pkgdir/"
}

