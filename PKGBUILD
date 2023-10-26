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
sha256sums=("fe694885dcfb90edd1d283dc44589411d9d71d76c6e83b511ac09f296178ac97")

package() {
    python3 install.py --mojo
    echo "Please restart your shell to use mojo"
}