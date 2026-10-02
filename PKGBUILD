# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=suiup
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Installer & version manager for Sui toolchain"
arch=("x86_64" "arm64")
url="https://github.com/MystenLabs/suiup"
license=("Apache-2.0")
provides=("$_pkgname")

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-x86_64.tar.gz")
source_arm64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-arm64.tar.gz")

sha256sums_x86_64=('fd8d0b139ff8a4ea4b18637f55d6b915e9e0ab7b161c1f74aad20ec93d79b8ba')
sha256sums_arm64=('fd358eeaca0dde4b628d9946c9e0fb965107de34ab27ceac4361389b98acfdd7')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "suiup"
}
