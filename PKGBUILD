# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.212
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
sha256sums_aarch64=('53815a214c5c35aebcafffe31bd8248477ca4fa051186a3f1fbf1b2c43169109')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2a533b674eb0a743c4b068ffc4441792e9b028f123831c202d8ed1b1ea1ace9e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
