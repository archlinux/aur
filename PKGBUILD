# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.9
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
sha256sums_aarch64=('5e3d29787bc506e7d01ddd5eb22dd830c43520e384e7e52db3d2975319ff7377')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b7bbc84587a05b4493cca72ed1f2eec7b75fec3175a24a455adcca3b81a58ce3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
