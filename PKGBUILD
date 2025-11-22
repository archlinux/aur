# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.98
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('c43079759c042961323d549aa68b20cd7e915fead3dcf8a0249719539c2cf2d8')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2994648e20255ba031825f65f0181b72dcc3522c1e10766e36f532cf58bf4602')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
