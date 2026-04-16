# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.7
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
sha256sums_aarch64=('17e358932f603fd3e028c57dd73483f387e63276aef5dac6ffb7dc29b8ab2fa1')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('57aaa94595f5074dccada1713f53a0a055e720a4a34aa93026e62cd869e50b6a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
