# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.25
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
sha256sums_aarch64=('c14ad827c8097d9343bbaa51767486ee2e122e7b330917545e19a86c0148888c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b4bf44260741941a35c404137e58dc3736d4aae231c20dd47b81d4eb56ca1731')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
