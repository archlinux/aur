#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.2.0
pkgrel=1
pkgdesc="Modular installation tool"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "python"
    "python-pip"
    "libxml2"
)
arch=("x86_64")
source=("https://dl.modular.com/public/installer/deb/debian/pool/any-version/main/m/mo/modular_$pkgver/modular-$pkgver-amd64.deb")
sha256sums=("6b1eda633e554ab9c6db1f4a5508c193158fca45466f47b27016922357db62d7")

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}