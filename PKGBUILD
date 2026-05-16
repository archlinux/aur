# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.3
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
sha256sums_aarch64=('4f2a3e3040c6dc6717961b1034e7ae651940c449065d316c6c6e17a4b78293da')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f8ae8678c9bccdbaf99777f36ff2d5efe689d473384f2e94b84d6cda256d2540')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
