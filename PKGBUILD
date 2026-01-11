# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.13
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
sha256sums_aarch64=('083d403923f97bc729c7cbf8992782c8d94a8d7b134b1e0b32fe465f4deb8ab4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cccaaa68abded212c150d987bf9454614865b24bbd5f1d0012f89afa62c5a084')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
