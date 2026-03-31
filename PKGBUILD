# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.12
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
sha256sums_aarch64=('842b3ea2f6f220dde089f32d5449c4bb63796124651831b1700cb4d364ba2c7b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('bb841fee8032cbaa69581aeb486ef010778d371f589c2224063d9a2343a36ed2')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
