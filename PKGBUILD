# Maintainer: Tyler Furby <tyler@theforge.xyz>
# Maintainer: Robert Zhou <meep.aur@meepzh.com>

pkgname=renderman
pkgver=24.3.2208291
pkgrel=1
pkgdesc="Proprietary photorealistic 3D rendering software produced by Pixar Animation Studios"
arch=('x86_64')
url="https://renderman.pixar.com"
license=('custom')
depends=('libidn' 'libicu50')
install="${pkgname}.install"

DLAGENTS+=("manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website")
source=("manual://RenderMan-InstallerNCR-24.3.0_2208291-linuxRHEL7_gcc63icc190.x86_64.rpm")
sha256sums=('a99631bd887c69ad1c7eb7fdb43c5b4259c780e9f3b30da2a970877a91ab3063')

package() {
    mv opt $pkgdir/
}

