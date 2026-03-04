# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.17
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
sha256sums_aarch64=('a8c8958274c9b6d9939253b7779a8628c03ec34abbf874cfd5021dd1add12f83')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('dbfe556df45ac999eff95248269ccdd06ee2052983bb03b9501fe9dda2d1f695')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
