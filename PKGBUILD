# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=26.1.2324948
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-26.1.0_2324948-linuxRHEL7_gcc93icx232.x86_64.rpm")
b2sums=('a6405b857bfc40a108d95c33861ed5d2e12ae3a3e5fb02a5d8b148fa10b3b165620cee346940143a673561c8b3339ad070ec396ff3dbeb1162f7a876c688b721')

package() {
    mv opt "$pkgdir/"
}

