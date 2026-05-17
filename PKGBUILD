# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.4
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
sha256sums_aarch64=('978f070e280c36ea6fd9a03d64f813028dbc2434077ad5cb6aecf37423e156d7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f0734928d5df360777f51f807df18b28c1d0c006f806ad0bd35a2420fabd0835')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
