#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.2.1
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
sha256sums=("1432602b6c30b3860f6d70e48807e6b2a712614ca40b14a5fee2f7702aa5fab4")

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}