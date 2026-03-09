# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=suiup
pkgname=${_pkgname}-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="Installer & version manager for Sui toolchain"
arch=("x86_64" "arm64")
url="https://github.com/MystenLabs/suiup"
license=("Apache-2.0")
provides=("$_pkgname")

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-x86_64.tar.gz")
source_arm64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-arm64.tar.gz")

sha256sums_x86_64=('72186a554eca006fea3270beccb13b2c4b4ad9ca69f5af9d745082078089eb2d')
sha256sums_arm64=('7710d81421e72fecc46cc9f35bf8bd1ff114073e5f28cd3f4154a9a99e3ee6bf')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "suiup"
}
