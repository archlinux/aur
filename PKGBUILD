# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.21
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
sha256sums_aarch64=('7b1624f2ae8e309d57866872de84cc071286de59e00121f01af315a4628ba31a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c8404260777dcdd86d5c69d403b5774d1aacc6b397579935670032a5d465f154')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
