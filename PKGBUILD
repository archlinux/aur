# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.11
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
sha256sums_aarch64=('596200de07e9bcec9fee3f73b84bc211aa58294e143c8379a00b8855abadd9e9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a533307c86c1b693c9bc52db2702bc11221e55b5c9137b88b629f099a25431fa')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
