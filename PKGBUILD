# Maintainer: Ivan Chetchasov <vi.is.chapmann@gmail.com>
pkgname=libcvec
pkgver=1.1.0
pkgrel=1
pkgdesc="Generic C++ vector library for C"
arch=('x86_64')
url="https://tvoygit.ru/vi_is_lonely/libcvec"
license=('VAM')
depends=()
makedepends=('clang')
source=()
sha256sums=()

build() {
    git clone https://tvoygit.ru/vi_is_lonely/libcvec.git
    cd libcvec
    make build
}

package() {
    cd libcvec
    make install
    cd ..
    rm -rf libcvec
}
