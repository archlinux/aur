# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.28
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
sha256sums_aarch64=('5bf1dfc57e2a9ca1ddfec40688c30d40f044c7bfd8bc7b184e1cbb71612e1e73')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('9251d3a44209a6bcbde56b639a65b99d89e75947a489b8d551b5a66e966d2165')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
