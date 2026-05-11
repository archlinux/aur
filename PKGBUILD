# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.52
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
sha256sums_aarch64=('158babfbbf60855c0a7fb26c16eeec126fdf0fee227d241bf31aa5fd90a8df47')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('af326b595823f0b3a174ac65bb9d4bcdecf8380804b9c1f23e0236c4ea77a08c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
