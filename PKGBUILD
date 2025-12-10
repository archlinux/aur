# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.141
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
sha256sums_aarch64=('25a9369d114bac25a7f6988bb25b17c35b91bfe393ab419c7497ee04cb2c0cd5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('82442291c86b6da12c06b85b685fe52d4292ac6e389df43255d973b1e3fa589b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
