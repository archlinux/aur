# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.204
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
sha256sums_aarch64=('fdb8a00c4762caaf48a3ccab249ee77b62d87ce82ad3aa460ff9c863a0159d6a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f845137f6ace485db45b22d18af8c77ec59bdf75ca22c5b36153747fafba4557')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
