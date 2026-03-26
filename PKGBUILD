# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.5
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
sha256sums_aarch64=('57650f67f4758cb89d62226b00fcf6fe29ad75b2c69aadb37afe2c9ad046106e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('dccc41af6d861e27b83aac3b594ca6380fad68a3463e547b1132befb96d8078c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
