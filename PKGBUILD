# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.5
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
sha256sums_aarch64=('a6244ecce03f303a8945fae330f17964469fc0780fa3555cde80fb97ac46f2fb')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('bf6f75da089b22073bcf23754cc3be351f713363164e5bdcd3e49501c811b1c5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
