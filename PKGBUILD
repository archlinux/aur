# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.144
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
sha256sums_aarch64=('2c6aea290e5149940a7a8c6f6c37fc539d582e492aec4a8743b7b33899969c3b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c45d0c2e47684bccfa0f3a7d1c7d57dd260ae1ec6ce84587908a4600fbef24d3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
