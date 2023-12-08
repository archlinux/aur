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
sha256sums=("dbf10c14d2de0e447af97e674b340989dabe11622b3e7021ea899aba78e8e807")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}