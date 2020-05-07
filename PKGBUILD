# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='plymouth-theme-blackarch-glow'
pkgver=v1.0
pkgrel=2
pkgdesc="Plymouth theme based off of arch-glow featuring the blackarch logo instead."
arch=('any')
license=('GPL3')
depends=('plymouth')
source=("blackarch-glow.tar.gz")
noextract=()
sha256sums=('0d20e63e25fe0f50eeba30b2d04f8f5734b1a1cf59e88fc625a464d584479566')

package() {
    cd "${srcdir}/blackarch-glow"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
    install -Dm644 * "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
}
