# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.3.12
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
sha256sums_aarch64=('429758021097e6fc5419c097965c9373ff426da38de9dfbf180accf721f8712f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2c42d22ade7e4b23be3660af4910c49c1eec29f14c19bc80d7383726a6ec16b3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
