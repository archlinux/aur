# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.37
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
sha256sums_aarch64=('54083a17d3f8966aa4cef35a9803e2dcee8988f6ab4b86bb12e38d5caf85c71d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('b58a7e8c0c680f6dd018accc89e789a1169f9e252bb4d66bec87a085ee7861dc')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
