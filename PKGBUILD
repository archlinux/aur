# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.9
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
sha256sums_aarch64=('3d989ea59c542da2b96ed2484524bce254719fa470da85fed6a631a472ac47e5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7727b84cd077c954d914b1cf7c19eb81530d110373173b8cb41007f34f6efcd3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
