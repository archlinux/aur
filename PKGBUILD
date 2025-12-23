# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.193
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('4628a165647dd3ca515c91945fa7d1f19c2e7e2dd9e28e6c5e5ade224a7c9777')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('aa2dc94fbecdabbe20846a6d2fe8348d7a3f0c134508ff8a6aaed0be0615233c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
