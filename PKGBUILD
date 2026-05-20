# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.6
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
sha256sums_aarch64=('c4437b2712ed96837cb06b448b04d3d20f7ef100735b06ad319ab79ed011192b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9874d0857f7b01a09189ebb8af42ef20d556be3f0d054563e5eef1234528c71f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
