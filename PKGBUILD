# Maintainer: Lenny McLennington <lenny@sneed.church>
# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=polymc-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib' 'hicolor-icon-theme')
provides=('polymc')
conflicts=('polymc')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/PolyMC/PolyMC/releases/download/${pkgver}/PolyMC-Linux-${pkgver}.tar.gz")
sha256sums=('28148a20ed470fabc3f087e51579073ac402fc3c5cdfb7406acefb36cb87dff7')

package() {
    install -d $pkgdir/usr
    cp -r $srcdir/usr/. $pkgdir/usr
}
