# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.20
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('ad12f6dbf5e942ff121b939cc47d599471d19ec1a3380d520b272d4556a7ca52')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('8cf9d35a43715fe34b8c20e0c781e1a4ba20a6afe57a9a628f5f818210c55d5d')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
