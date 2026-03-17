# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.49
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
sha256sums_aarch64=('e900fb7ba76a4990d114640abf32841442f2e696e49cd88542e1180d2d89c6ea')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('e49a1b2b7028f65235d47712cad98839542b1094290f85d66390044c5c432926')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
