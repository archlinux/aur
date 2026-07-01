# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.13
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('bbaccdd374aaab66cd97c7f8ad1c080aa393610fa5f80ee8dfc007f9500afaf9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('157afa289d1a8d9372de0ce19ac726119b937a1f6b201808d46f06e4e59bb348')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
