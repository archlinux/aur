# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.29
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
sha256sums_aarch64=('70baf769395ca4e7a68924026530c390eace194f3b7e4919d4efcb2aa2eed3c0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ea800b7ff56226b70952126c9fc1e2517ca4c4b5682fd9d3f9e87449697a1194')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
