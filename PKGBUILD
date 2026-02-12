# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.60
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
sha256sums_aarch64=('0ed470eb0321c098d4c4220af113d2219858e4a314b0b922550e703fbcc83f34')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('138eb158e699bd3879273b2a679f98d7a5d8d3d437ba3f5ac9e2fa7ea2388604')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
