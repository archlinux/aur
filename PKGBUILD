#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.5.2
pkgrel=2
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
sha256sums=("1eff3bcc8a1e5746ad5be7c2ac3827e316095f22e01cffb8fda29f0b79bbb5c4")

install="modular.install"

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}