# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.11
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
sha256sums_aarch64=('2fc9fbdaafe93d7b32085f604f90b79b5aaa2559478dc188979ac69d5e0eed55')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ace0bfc38ca4a6f74eb24a53ebd1ae383c81878b5a30eab8027c68a0a15b1b45')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
