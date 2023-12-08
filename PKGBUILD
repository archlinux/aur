#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.6.0
pkgrel=3
pkgdesc="Mojo Programming Language"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "modular"
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/main/install.py")
sha256sums=("aee8c68cc4799df8271e0db9e464ebd2917a07fd3c063838965373002c5b72f3")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}