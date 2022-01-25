# Maintainer: Lenny McLennington <lenny@sneed.church>

pkgname=polymc-bin
pkgver=1.0.5
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
source=("https://packages.polymc.org/1.0.5/lin64-system/lin64-system-${pkgver}.tar.zst")
sha256sums=('8281af6f1702aa68a250646d665673d72afa11d3446b506facacece43ccee971')

package() {
    install -d $pkgdir/usr
    cp -r $srcdir/usr/. $pkgdir/usr
}
