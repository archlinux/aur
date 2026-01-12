# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.15
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
sha256sums_aarch64=('2794ecebc7674174897d4c98fadd7911a670f00356baf0267b89235e1e1fa30f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('df55778ea1bb209d86d7646b8a1d993b6d94075fa6c668368244022cedcbd41e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
