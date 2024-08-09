#Maintainer: Sharktheone <sharktheone@proton.me>

pkgname=mojo-libs
pkgver=0.1
pkgrel=2
pkgdesc="Shared libraries required for the Mojo Programming Language (ncruses, libedit)"
url="https://github.com/Sharktheone/arch-mojo"
depends=(
    "python"
)
arch=("x86_64")
source=("https://raw.githubusercontent.com/Sharktheone/arch-mojo/1132641a15e967f4825cef990b002bf26441ae62/src/install_libs.py")
sha256sums=("8a96da5c53a454cd245599ac8308c00e8805ca9407f602340c545bf14ebd09de")

package() {
    python3 install_libs.py
}

