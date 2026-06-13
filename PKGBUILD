# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.6
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
sha256sums_aarch64=('5bc272b49c60cfdd0a6a4a1948f4530ce992bdb8eff9ae355c4a40c00f75e534')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6cac705f9259415365079961c5f652269ed9e3a4613ce874f15a9d36366bea7d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
