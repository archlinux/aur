# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.6
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
sha256sums_aarch64=('f8bf31bff067129108bbf5071ba30c5bbff8c68359df16abf5b5682d3f243819')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('013ecd11bb1986d4730f31a50872a7793c881317f6dd43f2f332fd755d0a5a45')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
