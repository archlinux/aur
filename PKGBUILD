# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.49
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
sha256sums_aarch64=('b7e6cbdf27c030c72846319c5213f8e6af94efa831ecd9edd2f3223b87adeae7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0b373d64650073df36616af189c18cecaa3d5cd19ae2121300cafed1efa54b11')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
