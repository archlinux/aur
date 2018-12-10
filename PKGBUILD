# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=meson-cross-x86-linux-gnu
pkgver=1.0.0
pkgrel=1
pkgdesc="Meson cross file for x86 Linux"
arch=('any')
url="https://github.com/Oxalin/meson-cross-x86-linux-gnu"
license=('')
depends=('meson')
source=("git://github.com/Oxalin/meson-cross-x86-linux-gnu.git#tag=${pkgver}")
sha256sums=("SKIP")

# pkgver() {
#   cd "${srcdir}/${pkgname}"
#   git describe --long | sed -r 's/^meson-cross-x86-linux-gnu-//;s/([^-]*-g)/r\1/;s/-/./g'
# }

package() {
    cd "${srcdir}/${pkgname}"
    echo $PWD
    install -Dm644 "x86-linux-gnu" "${pkgdir}/usr/share/meson/cross/x86-linux-gnu"
}
