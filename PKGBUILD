# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.17
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
sha256sums_aarch64=('73a2c63d2b37df7a180e4ce51554bc65397edc5ef837c868420c13e22ba8cda5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('dae7b74b5e0a5928ee4c93c1aa52a3a6f20252e3e49a26ccaf898539e38041d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
