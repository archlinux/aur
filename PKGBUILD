# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.46
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
sha256sums_aarch64=('7464f3fe54dc4f13a07db5098f60f60fb5f495d5acf7d0721759bdd464474753')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('65271db36a0e2b05358d3ef6c470f177b8216ce0a43965bd01cc20b4f74f649d')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
