# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.161
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
sha256sums_aarch64=('02721813f61821c2c41dff8d8fb5a264e6baf9b142e8ec52d71c49dae39a2864')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('83cf278a34db711a854506d44a67692ec717ebc63854b23bb75eaa359e90230f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
