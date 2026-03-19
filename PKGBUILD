# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.51
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
sha256sums_aarch64=('83fb069179e6d3b4225b2cf88f07899f8f0789a1c887e09ac7423ddf434cf41b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('2c424182962c90ff2ae6b7ad8dca953fc43a08525d9a2de7ef5d014c7f66c994')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
