# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.19
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
sha256sums_aarch64=('4e41d7b127f15f344a265545b4f83e79d08305e8ec9459cdeb7939ea20c0af00')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('093614b7dfdab7b64109be370d96722bdf6918f1edb662861d13b11ddedc9405')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
