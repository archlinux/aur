# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.26
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
sha256sums_aarch64=('c2f387dcef451379eedd51702c029b190667a9cf7069037d9d19f258b059a61c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3c7a6dd1dc46e3e39a60e0e2f371176fbf3d9681e29b670991491f1172062454')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
