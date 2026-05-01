# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.31
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
sha256sums_aarch64=('d8867e77b901dd04e707f459f44b3e28f23a6f0c2d740f1bb8af6f4b64ac19f7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5d3853e29c81d7a134915690625009f5736ca84070529e69796cf62e12232c9e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
