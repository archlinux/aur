# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=26.3.2351688
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-26.3.0_2351688-linuxRHEL9_gcc11icx232.x86_64.rpm")
b2sums=('c1d91d1b0f4e63c77013157422c75ab1c81e680b43ff95fa499ad1b9cae8a2395b786c1c81ebd199191005a4ec87214d07e9d5c5d28cf98628bde143a74c72d5')

package() {
    mv opt "$pkgdir/"
}

