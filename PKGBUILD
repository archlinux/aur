# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.16
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
sha256sums_aarch64=('e7ed83d8d68b27beb03483a97570567578ad4b45448ce56068bdd0e55db40479')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('802b3f4995b22a105d155ff702f83101c4c1d2584b15d066183e9b02669f6d7f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
