# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.3.0
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
sha256sums_aarch64=('94521f547a44749b1908a0805efba75c2c87168707a7b9a38bbcf2b4ffbb89c1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('a9e00edbdfb795bac6ab92a8800257885296c55beb29d91230f70fbe8a9fa8d3')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
