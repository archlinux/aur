# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.42
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
sha256sums_aarch64=('af37808866614eca16c5f6a5d58a31078c487345316c11d5912d3af1d3f540e0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cecb70035f67a92038ebeb76aa6cfcba4d68b374089ee7ceb243d09c1b6cd56f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
