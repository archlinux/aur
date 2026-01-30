# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.47
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
sha256sums_aarch64=('869fab26e9c83d4092475b4e1a0f928e152ca46ee6698b58011c02ef46008f3f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f87592cdbab12d0cc598876a36a573986e8d19dd59ba6b15d9d1fb039af5d57a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
