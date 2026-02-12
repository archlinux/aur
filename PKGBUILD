# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.62
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
sha256sums_aarch64=('18a45773ad01e5298a9c1e05c9baa67b18c1c6abfeda90695c367366167c9644')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a696b031a94badf0b2d4c6934c228cca3ffb1d985fb199ad6e1a67d30c1fe620')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
