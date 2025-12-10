# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.143
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
sha256sums_aarch64=('c6fc3a38f482739a4bce75e971fd003c4236dd9370a8cd76799accc8058a4de9')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f2ef237ade6a4f70317d47e8caf3b75573959944a5357434a84bf48fe45b34b0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
