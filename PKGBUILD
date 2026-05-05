# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.37
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
sha256sums_aarch64=('e5894bebc76a46d4f0b6ca65ff0da81c6b7d578b92601172c3e4e713546cff66')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('24f887c801d113b31930533aac1433816348006ba61dd8ca0d792bfff4b75960')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
