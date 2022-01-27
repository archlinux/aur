# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL-3.0-or-later')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('polymc')
conflicts=('polymc' 'multimc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://packages.polymc.org/${pkgver}/lin64-system/lin64-system-${pkgver}.tar.zst")
sha256sums=('0f76ab03f455f31ee8457fe81da2744db6176e338b68c30ce1569d85e037ebc6')

package() {
    install -d $pkgdir/usr
    cp -r $srcdir/usr/. $pkgdir/usr
}
