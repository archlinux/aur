# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.9
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
sha256sums_aarch64=('2555fb49d5065a01f44217913f0987ccdbbd5b83a5de12e75c72f2caee98878c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('729103e77cf3f23573d4c3eac472f89265a0e65f3d2ba992393ef5875c2d6732')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
