#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.3.1
pkgrel=1
pkgdesc="Mojo Programming Language"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "modular"
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/main/install.py")
sha256sums=("7fa19d2403f11307ebac106781a21eee08e4a6f9230370a69a03ffe96d8ec905")

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}