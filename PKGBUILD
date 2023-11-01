#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.2.2
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
source=("https://dl.modular.com/public/installer/deb/debian/pool/any-version/main/m/mo/modular_$pkgver/modular-v$pkgver-amd64.deb")
sha256sums=("f7cea3ba3345ca5e72f498dc971adb4f25db6412527b2e7e34056dc72890a6d8")

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}