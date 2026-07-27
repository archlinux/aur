# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.6
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
sha256sums_aarch64=('9d3c24c72dd817f9ac3c73c4dad2ec5a31dc4c2b93071846a3cd6c8f5a8fe8d2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b5b7fa9509757b60249de8f22874b641a8b59a61b2e177b6d24e46805c7f352d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
