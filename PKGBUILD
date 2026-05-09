# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.49
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
sha256sums_aarch64=('a2448d77a7845c7a47d97e2f15492248bed9670b328625f1a1b5acbce0cf649d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('41b7b28917b6db08613f645c0bac8ee37d1cf67eb1212ff995e6cdf7c4d82d76')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
