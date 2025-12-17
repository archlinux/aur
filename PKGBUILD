# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.165
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
sha256sums_aarch64=('5e7027750e45cc697a9dd40997286b4f3cb8bb1b63370d1aab1a1f0b34971346')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0affa08f0f7b535b0af97cfc67ecc0b969dd20dd684e734b37fd8a89b4d8f5f8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
