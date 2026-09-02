# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.27
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
sha256sums_aarch64=('8cbc134eb5e100baf61ee7196150f503e352056e703276e2d8637c38bafd2c39')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4af5494f9433f59db8c1e344198f0ee72a50c06ec009fb4a8aeab4c2d4abd702')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
