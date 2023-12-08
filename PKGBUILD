#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.6.0
pkgrel=2
pkgdesc="Mojo Programming Language"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "modular"
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/main/install.py")
sha256sums=("5e1c423198fa6fb60cd020b0a857567de03a4ab93a2f78a1a7d6bc8888d2e3da")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}