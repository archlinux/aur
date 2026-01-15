# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.21
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
sha256sums_aarch64=('1beaed098ee35338933b814646efff48f96b830138ee2396a94b0495660ac0db')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7cd95bd83ed131775874e8b2bfcbec9c5cd64c856c5bac3c81774f1e0b0cb6c3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
