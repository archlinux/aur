# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.35
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
sha256sums_aarch64=('aa4d5469d096f1956f3f28f452d5e35ef0bf927190dc0aadd3f0f605dd8c1730')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('ae989c9efa5d4beed9df05d40723f86388a02404c05583398308576094978b87')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
