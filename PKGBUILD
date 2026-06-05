# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.16.2
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
sha256sums_aarch64=('eb1d5876c70675cfda93c4a1c4385d727412fae73154f1f005d155626df5b559')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('06a79c5bb7f8d01716b2440712cf67facd36db59188809aeb232374b206bd429')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
