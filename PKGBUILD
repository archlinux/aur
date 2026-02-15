# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.5
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
sha256sums_aarch64=('90e4df8ebc953952e4dc4f17c2e47f4d506bc44b048aa3d027b1791bf2fcd575')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c766b662c591a1f75aa5e50c4385fbe995f5896a8b56bcc67bef1af3f31e0740')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
