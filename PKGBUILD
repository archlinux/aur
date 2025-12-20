# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.175
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
sha256sums_aarch64=('5b06a18882194c5bf283bea15fc2076990b901835501e1afb631e627161eee72')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('283fdb4616791187387975d5defc4bf32a7865cc821baa7b364efd608e2831c7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
