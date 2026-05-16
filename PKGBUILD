# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.1
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
sha256sums_aarch64=('58bdd72718817043f9e3328c9f78acc6c667dd26e5fd013a6cf3c03593de2374')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f23bcabaf3f2fa9b66b8011813606501885aa6bfdf31030d4c061bd175e18300')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
