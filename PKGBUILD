# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.20
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
sha256sums_aarch64=('a0813a706c8865cf61b2ec152f116af09519bff703c774ab16b4a667b154d683')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('90188b53eadbdf36e9ab450c2c37ed567471651005fe28f4cf6587a7fb4eeba5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
