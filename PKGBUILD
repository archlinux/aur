# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.160
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
sha256sums_aarch64=('2c0ab400bfc3812abc460518f7c41610d7770f558c235b273afc43434a45395b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ab2450249a65165e491ada82f54f61e8b1339a2af2140707e6b086b3dfec5e28')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
