# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.2
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('e9498f1ff486853d9dfe77fc0d2b1a7fae196a9073ef6e0be6904ed6be03a00c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('10ea1c887a5920e9d30dd02562274ae55a1d80759d320d9c7f90b97cf473a2e5')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
