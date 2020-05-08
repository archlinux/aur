# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='plymouth-theme-blackarch-glow'
pkgver=v1.1
pkgrel=1
pkgdesc="Plymouth theme based off of arch-glow featuring the blackarch logo instead."
arch=('any')
license=('GPL3')
depends=('plymouth')
source=("blackarch-glow.tar.gz")
noextract=()
sha256sums=('e9e93b87343ae2c68a1dd47c75d7d883d4e841f6cac8a1484ebb4990a558fdb9')

package() {
    cd "${srcdir}/blackarch-glow"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
    install -Dm644 * "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
}
