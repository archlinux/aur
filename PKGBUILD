#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.7.2
pkgrel=1
pkgdesc="Modular installation tool - Repository: https://github.com/Sharktheone/arch-mojo"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "python"
    "python-pip"
    "libxml2"
)
arch=("x86_64")
source=("https://dl.modular.com/public/installer/deb/debian/pool/any-version/main/m/mo/modular_$pkgver/modular-v$pkgver-amd64.deb")
sha256sums=("d4dc256701bf941c4d8f72200082cdf199af2844bf4f30ff4e15d81f874cc3b1")

install="modular.install"

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}