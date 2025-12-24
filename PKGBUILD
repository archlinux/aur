# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.195
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
sha256sums_aarch64=('2fdd5e021fb220d0ead72a69eb749e2178b471d06bea5004a5268acc6f7edcee')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('cc6cb26422fb01eb6e23641d1539f912e22b62d06dbdc5a8087333144e9a9c7a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
