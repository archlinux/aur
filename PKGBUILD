#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-libs
pkgver=0.1
pkgrel=1
pkgdesc="Shared libraries required for the Mojo Programming Language (ncruses, libedit)"
url="https://github.com/Sharktheone/arch-mojo"
depends=(
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/caebda2cf9ca993e407bdbe587a41c7d47ba96eb/src/install_libs.py")
sha256sums=("cc145f28f339ddd87d8bd24ee3f5be764e60515efece621c48330d609109a7de")

package() {
    python3 install_libs.py
}

