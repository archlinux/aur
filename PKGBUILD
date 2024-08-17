#Maintainer: Sharktheone <sharktheone@proton.me>
#Contributor: Janrupf <business.janrupf@gmail.com>

pkgname=modular
pkgver=0.9.2
pkgrel=2
pkgdesc="Modular installation tool - Repository: https://github.com/Sharktheone/arch-mojo"
url="https://developer.modular.com/download"
license=("custom:modular")
depends=(
    "python"
    "python-pip"
    "libxml2"
    "mojo-libs"
)
arch=("x86_64")
source=("https://dl.modular.com/public/installer/deb/debian/pool/any-version/main/m/mo/modular_$pkgver/modular-v$pkgver-amd64.deb")
sha256sums=("fabfe388c31e50bf684b321ad314e09fc348aefe2fd8da9fd33f32e3a98058d2")

install="modular.install"

package() {
    bsdtar -xf data.tar -C "$pkgdir/"
}