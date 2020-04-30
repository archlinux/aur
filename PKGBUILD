# Maintainer: dorianpb <dorian.peanut.butter@gmail.com>
pkgname='plymouth-theme-blackarch-glow'
pkgver=v1.0
pkgrel=1
pkgdesc="Plymouth theme based off of arch-glow featuring the blackarch logo instead."
arch=('any')
url="https://github.com/ChristopherHX/mcpelauncher-manifest"
license=('GPL3')
depends=('plymouth')
source=("blackarch-glow.tar.gz")
noextract=()
sha256sums=('0f7c1a64d975ccee78cadace965929cddb1659451551175fe5d16a7309e9f45f')

package() {
    cd "${srcdir}/blackarch-glow"
    mkdir -p "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
    install -Dm644 * "${pkgdir}/usr/share/plymouth/themes/blackarch-glow"
}
