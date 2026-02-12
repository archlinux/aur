# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.64
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
sha256sums_aarch64=('6eb5298d166f77a163d7c8c9e82bbfea597e26e30d2c567893343935892fd946')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('448349097ce93d96e5d227940fde54f71fff0d476cb2b1672417efda92a57c1e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
