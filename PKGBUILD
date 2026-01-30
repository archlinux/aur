# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.45
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
sha256sums_aarch64=('e84bcef4c2d9a9c1f1d5dfdd50654912e26cc3fd3234e7789c8ebabd2e372cc1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ed66ddd5b5478142c76ab6bff46481dd91bebd642d1e50f217776633e1adc610')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
