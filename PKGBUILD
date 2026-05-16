# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.2
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
sha256sums_aarch64=('c94dee22fce144dd86c062793974353a69ad056073b90ecc3a7858801789d01f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a33cfe572dd13a2a5004891ff3f35af8384995a124eec6a81fdce0de88d2a82d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
