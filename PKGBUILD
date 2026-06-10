# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.1
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
sha256sums_aarch64=('76ffbfeaa70b21c5442139a1e0333d5870547012f8d7b78235a9b9d4dfdd4740')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('999037b6bde5c1196618d32f9f7009cb7e14927273f64da0e56a2cf8d7b3a454')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
