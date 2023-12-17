#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.3.1
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
sha256sums=("a456c99e5f5e62d127b60a450feed6fa217bdd58621ee3204904cd6b1c693198")

install="modular.install"

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}