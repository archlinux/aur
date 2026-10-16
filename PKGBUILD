# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.19.2
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
sha256sums_aarch64=('3f73a474065b4b7c4a64cef2395a6123ae1039c2e41f0acbe29ae6521b50df66')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4eff8d2cf8614ead97eadf1123d46033dc975eadeac3df04644a64bae0f9e819')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
