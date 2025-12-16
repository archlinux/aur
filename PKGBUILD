# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.164
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
sha256sums_aarch64=('efc5fd86dd5e6c0a8e58319eb2c8ded621b732488418b4d7a9edf0c2391fbd63')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c83bb1c86ca782fd3d01c0272c154d6719cd7b9e650d573f4a033cd67d640ce6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
