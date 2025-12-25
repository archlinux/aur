# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.199
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
sha256sums_aarch64=('78aa9456b07993fe95e11b4bd5b07ac58b1d8ca19254cc95876f62332113f0c0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('341e61266fc83c1f8daacf6eb444961a1b91cac389ebfafa0bd829169328c6be')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
