# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.6
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
sha256sums_aarch64=('a02f7a8dda114f30559b73b94dca5302742731bcac6394463436ba1462733d83')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('1299d49d1c9e8b07217d92cea14050650c0b5a81c2ac380d6ec0d1d26abbe61a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
