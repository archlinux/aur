#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-libs
pkgver=0.1
pkgrel=3
pkgdesc="Shared libraries required for the Mojo Programming Language (ncruses, libedit)"
url="https://github.com/Sharktheone/arch-mojo"
depends=(
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/676397111f633adab2580c87d4b031d7282541c7/src/install_libs.py")
sha256sums=("bed33dcf5cc71021ab39d62fe5f2c7e9f880035de57f9de5583a46c5ec87cfed")

package() {
    python3 install_libs.py
}

