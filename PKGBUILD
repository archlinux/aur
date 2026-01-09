# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.8
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
sha256sums_aarch64=('64f1451fe6f498377fcc5f6dbdb80e707293fb73361f9acceee7443cfc27a589')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c47275ad4ec43c8412ad2107c6f00e720ece1297584c370c32d466052d61188b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
