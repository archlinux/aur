# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.36
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
sha256sums_aarch64=('3f239a57002d8ac2ae5a3c5b6927b7453c0f1f830bf57be9ecb5f8d1b3475188')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e7373f32221edd0a9237ffe491e9cafc568e63dc703de5d43d24529c3eafb25b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
