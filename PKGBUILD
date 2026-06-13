# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.5
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
sha256sums_aarch64=('4fab00b4a22e3d9c48d37e081917833a078e68b10880195b59e2efbe9cc03de4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0798e2189ef130970dd22d81acbdac39261aed3ddc1e28aa942734ab381c421f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
