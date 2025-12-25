# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.201
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
sha256sums_aarch64=('bfc735cfa1fc30afbd9a0e326882a17fa70710e04be9e29c0f9329f6cd080859')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9cf4e96fdcd1b51e96bb1fa912894d87c6d931858bbb2665c7175a7d492b3354')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
