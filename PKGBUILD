# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.120
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
sha256sums_aarch64=('4aaf4f65b6334dbb169ee869fdd4ff4608c2ab4bee92c395e460e4d3fe6d40a7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e7a3c2b8063763834484dc1614ea84c4c39b3c469911f06974f039e7ec243a97')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
