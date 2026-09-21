# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.32
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
sha256sums_aarch64=('568461b7d4d8c19865c97e9a1102e613049c6039d01fe772154de873c1865840')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3046e0404fdc60fb80307e7a47824ba07477364178a4d09baa8548496dd6d43b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
