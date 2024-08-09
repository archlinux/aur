#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=24.4
pkgrel=2
pkgdesc="Mojo Programming Language - Repository: https://github.com/Sharktheone/arch-mojo"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "modular"
    "mojo-libs"
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

install=mojo-git.install

package() {
    export LD_LIBRARY_PATH="~/.local/lib/arch-mojo:$LD_LIBRARY_PATH"

    modular install mojo
}