# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.56
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
sha256sums_aarch64=('2429f32521dafa3d860d4d75df2de8565fcdf4f8d41fdf3b9663a97ff7c33450')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5e440805cbb9f2994d3cdbfc545f75e9f2a06b672b41bcf2e921ea3e082d1495')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
