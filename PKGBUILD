# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.34
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
sha256sums_aarch64=('39a9db53cd55e59cc28d5216fff2b0b9f4c54bae675b8d688a3aafec1d04897a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('79f2e9efd2275c12930e6b81ea2fa562b65757d4ee3d971c69d008b3937ead88')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
