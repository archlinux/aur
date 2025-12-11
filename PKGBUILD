# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.148
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
sha256sums_aarch64=('118bc1c942047a6c1b2f7804e25a0433f8b95e67bb01f0355319ddd9af266108')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('bcfb7f615c55ac8483c779b2bf38cbd73509f82dd1ff55ac448c31c1b3df125c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
