#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.6.1
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
sha256sums=("d8966e3565ac04f8494e34bf75e1168b3637fde872e6edc17e57e975870e91a7")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}