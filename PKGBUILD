#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-git
pkgver=0.5.0
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
sha256sums=("972bfd08e0690977a738c76e489a89592735ea307662b1b2c705fe22897c7010")

install=mojo-git.install

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}