# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.45
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
sha256sums_aarch64=('5e25502f2c4ac3c91fd62221dc59d78370a1a7e75158d70446886d42bff98c19')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ee066e3391c94630472d04ee3d41c9195d710b8619cbeb9476dbabf861783f5e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
