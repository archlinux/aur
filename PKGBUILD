# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.42
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
sha256sums_aarch64=('276a29a6f0a8b5cd179fa4f0c3307ee78a6d25b5be2841a3b1f34c243930f918')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('6ee8357f084bb136642d785730cee12a3e082193e6707a21218770677b6185b3')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
