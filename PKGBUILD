# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.9
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
sha256sums_aarch64=('ba377089eb7ed3e32ff0279c3545ec9e29c7184e486f736a0b2f66c8904c449b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9024f8473e5df73e4bf75dc03f8cb4f53f162d3440e339e55df504d4a64f08b1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
