# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.223
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
sha256sums_aarch64=('e6549b392ea52842a995da5eae4d35209df605066613b71e7883457d8ecaee9b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6c1bf6114a0b08fdb4c15ceef9da4480df0297699e045db7dd9a2950b0b9cc09')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
