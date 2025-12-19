# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
_pkgname=suiup
pkgname=${_pkgname}-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="Installer & version manager for Sui toolchain"
arch=("x86_64" "arm64")
url="https://github.com/MystenLabs/suiup"
license=("Apache-2.0")
provides=("$_pkgname")

source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-x86_64.tar.gz")
source_arm64=("$url/releases/download/v${pkgver}/${_pkgname}-Linux-musl-arm64.tar.gz")

sha256sums_x86_64=('bf37c8f4b33eaea5cbebafa0db0a77b30e66cc5aa35215fb99497276bdf0292b')
sha256sums_arm64=('dc1c6f37a4f6eda02ce97c4cd3cdf2c05b84bd9ed52ec1d2359a3f7ee772084d')

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "suiup"
}
