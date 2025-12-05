# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.134
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('490d9395640afd7a510b073a6613a86d1014a4df317aaef39887055df4947a0b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6cc2ea149556119351bdbba0465ee09ceb66d43a66eca8ddc5f89b0827d3ed5c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
