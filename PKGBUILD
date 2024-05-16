#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=24.3
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
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/1419495c5d85c22afb5ce8f3309fdd86ea25d28d/src/install.py")
sha256sums=("f4fe8e1ad32ce410fd325d9db032a3613ec3986ae0529b76f911b80aefd56a60")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}