# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.58
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
sha256sums_aarch64=('beb3d1181f4eb054c813b9be4bf1e100df147108d1d3c964fb06c415858f43e1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f75e444a3b5bc96e616ed4a3cfcee8c42280efdd7f91893abb7002db9ecd9c1a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
