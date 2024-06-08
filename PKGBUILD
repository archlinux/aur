#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.8.0
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
sha256sums=("eff1b2b360e6c521b68e59010c8b9ad53077459839bc892c139a9f93c0c4803f")

install="modular.install"

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}