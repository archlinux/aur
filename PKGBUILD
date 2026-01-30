# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.43
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
sha256sums_aarch64=('ccd6b7b80f9cfb2c0d74c8b410d6272c4ab893e5527ffae795addc5baa01122d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c1a8b6896752e2ce9678ee5b812e119867edb25a054495358dd63cea85f69ca3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
