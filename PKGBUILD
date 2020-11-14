# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.0.14
pkgrel=2
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=('openssl' 'ncurses' 'zlib')
makedepends=()
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/trailofbits/cxx-common/releases/download/v${pkgver}/libraries-llvm1100-ubuntu20.04-amd64.tar.xz")
sha256sums=('7a680ea1185dfb83bc8a2c3bdb7930e5c1dfc7d78e3af16da65ca525e82ade39')

package() {
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/libraries" "$pkgdir/opt/$pkgname/"
}

# vim: set sw=4 ts=4 et:
