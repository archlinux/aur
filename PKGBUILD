# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.9
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
sha256sums_aarch64=('8cc511f9794e575e5d3c4c2654930d05670186df649c26b50889ac73c65dde21')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('85aeac95258d409d16ca34f1cfcd74c78d9d1a70b0a4154128b588e1405384f9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
