# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.65
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
sha256sums_aarch64=('7048deddf4caccf456d1adce8d84b23bb92ca7e53018f83a308f64bc17f41c5d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('264d236b37a539bc235ab5d67b3e4fd082844775353e5153514dc105e240ef6b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
