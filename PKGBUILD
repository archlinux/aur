#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=24.1.0
pkgrel=1
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
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/main/src/install.py")
sha256sums=("59c799cb6270f901d1c97f93484815fa0bd899e0832717f9453e42f08726ba64")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}