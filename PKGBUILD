# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.1
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
sha256sums_aarch64=('2ad7d4f96c9774a9a73c90c5662dba2d8c03321cd5fba8dea1a27d6fc4c26802')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('71386807c7a0e7a8d5f1259635542122d0569e265bd83733c98a7806ce7969c1')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
