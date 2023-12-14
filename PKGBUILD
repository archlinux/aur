#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.6.0
pkgrel=5
pkgdesc="Mojo Programming Language - Repository: https://github.com/Sharktheone/arch-mojo"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "modular"
    "python"
    "libbsd"
    "libmd"
    "icu"
    "xz"
    "glibc"
    "gcc-libs"
    "ncurses"
    "zlib"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/main/install.py")
sha256sums=("eb4327debdeb5d33f7c2ae6a83e7f320e5c1245ce77636c549891b5f7dd23a62")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}