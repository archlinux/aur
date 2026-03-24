# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.2
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
sha256sums_aarch64=('76eae5601ccb90454d90a9a0f9a6f5c189b84943a9081671f028e56e58c4dfc1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6d66c24f14742618f1d6248d2a8a9d9692d44e61ee15dcef70e8310920a2df70')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
