# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.29
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
sha256sums_aarch64=('faedc954ab549235a32f1bf10cb92206dbac58327a85530554e5e02feb28060e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d985e99d7e22446b78fc78a35cfa0ef8b0feff05be5288c4a0e1c6837b7a29f8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
