# Maintainer: Ivan Chetchasov <vi.is.chapmann@gmail.com>
pkgname=libcvec
pkgver=1.1.2
pkgrel=1
pkgdesc="Generic C++ vector library for C"
arch=('any')
url="https://tvoygit.ru/vi_is_lonely/libcvec"
license=('VAM')
depends=()
makedepends=('clang')
source=()
sha256sums=()

build() {
    echo "RUNNED BUILD BY $USER"
    git clone https://tvoygit.ru/vi_is_lonely/libcvec.git
    cd libcvec
    sudo make build
    echo "BUILD COMPLETED"
}

package() {
    echo "RUNNED PACKAGE BY $USER"
    cd libcvec
    sudo make install
    cd ..
    sudo rm -rf libcvec
    echo "PACKAGE COMPLETED"
}

