# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.17
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
sha256sums_aarch64=('5a03cf2abc71cef8c57cd03add3ff55a0c1d6e0d4af4b825efdc503cfce23ab3')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3957e8b9b80867633daf82cba43f17980c8daf71d4d265a40313fb21d5d58fac')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
