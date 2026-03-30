# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.7
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
sha256sums_aarch64=('3469c1880ac0321caa3547948489b3b8946d16a9553463e1e729abd190b3dfec')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5c778d84c61a9eb0a87d457d9a2e08694ca4e4424e5867bb7485b449c62c99ed')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
