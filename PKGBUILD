#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.2.1
pkgrel=3
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
sha256sums=("391638b454af1f16271e5736fdbc789a00c956b1d6a4e4583b8ddc7757800822")

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}