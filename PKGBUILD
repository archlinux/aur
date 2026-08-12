# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.17
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
sha256sums_aarch64=('7531c1a110546aaf04b465d98a3bf54018e1740f769077c2526fec6add5fc230')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3f14a4c61c7f6b0d3b6d933d1d212e64e19683eba6fa453ad98e46303afe144a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
