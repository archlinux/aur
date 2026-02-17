# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=suiup
pkgname=${_pkgname}-bin
pkgver=0.0.8
pkgrel=2
pkgdesc="Installer & version manager for Sui toolchain"
arch=("x86_64" "arm64")
url="https://github.com/MystenLabs/suiup"
license=("Apache-2.0")
provides=("$_pkgname")

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-x86_64.tar.gz")
source_arm64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-arm64.tar.gz")

sha256sums_x86_64=('84379fda32a466f224e40b54f729546ff268a5e682db2f5f1730432f3e7486d5')
sha256sums_arm64=('0040edc2c5c42ca3b9a40808c48a603afcbd35afaef3893a481366613eb8fe6e')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "suiup"
}
