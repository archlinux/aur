# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.12
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
sha256sums_aarch64=('277396c9268536301a4d3fca327bb2e4e0aeb76687d02affa99de3dfd4bd4d4f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('24a3cf2583d68e558913947a9871a8e889162113de3b21ad47eb6a501c12a011')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
