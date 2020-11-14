# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.0.14
pkgrel=3
_LLVMver=1000 # 10.0.0
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=('openssl' 'ncurses' 'zlib')
makedepends=()
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/trailofbits/cxx-common/releases/download/v${pkgver}/libraries-llvm${_LLVMver}-ubuntu20.04-amd64.tar.xz")
sha256sums=('1d6f576978b7aa4ab52133d3ee587e2c2b84893aa5b77c2f869be00113d31acd')

package() {
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/libraries" "$pkgdir/opt/$pkgname/"
}

# vim: set sw=4 ts=4 et:
