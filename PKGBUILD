# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.12
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
sha256sums_aarch64=('b96255ac5359c8037cc21a719040e177d31bef59f6d6f301dd0e84157e5be597')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('116f16ed1a6a056884362875a1ca7e88e451d0ede7b6c5438528fff3aedce855')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
