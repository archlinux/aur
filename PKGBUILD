# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.9
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
sha256sums_aarch64=('65490bc70285f57268455c7b5b32df35bcf6fb0c03a4296b1898cdc0132d38d2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a0c0812b506e20f055647339ac4153ca3399d8b8993074c2168df9c6cad71f8f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
