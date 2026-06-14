# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.7
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
sha256sums_aarch64=('ac80ea0ee7e3f10483bd98298654b6aaddc305c880b162667a03e742d9843fe6')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('60fe5a92dc9af64ec079348fedde17e12da6a867efe7e8353be8038480607924')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
