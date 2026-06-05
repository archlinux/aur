# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.16.1
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
sha256sums_aarch64=('6b77eec90eca0f29c8fe2d52825d11fc303f0a8513a919a4674502329b33f0c0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('206f9bc38b09b9b9b4ef1726fa2dc869fea3e75d03c411989c293a1529731ae8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
