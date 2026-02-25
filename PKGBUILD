# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.30
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
sha256sums_aarch64=('c3b21e18e6055ee6300e6db9e1fa28b1cb6f499fb55c7362460fce6a195e2509')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('873a3fadd39e7e4fc151a96658489354cae63c16abc7f05742b625e6ff5f97ed')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
