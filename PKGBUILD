# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.4
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
sha256sums_aarch64=('c873dfcc7e1e4817913aaa79e1079a8a3b6c666b0cada9fcc16afe0765ef657d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('68b64dc2989e53c0c7751a294548392310c789470ad963be6613943efa590b8f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
