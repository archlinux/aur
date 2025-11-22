# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.102
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
sha256sums_aarch64=('92122952e1e1113a70324bb511ea827709a65d4897ca7dd1525db7a23f919121')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b3d0d7906e725b2e38182148f0eb3c18b55c8dca608c463234b9485e8da1eecf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
