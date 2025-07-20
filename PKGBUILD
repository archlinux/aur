# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.46
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.46/opencode-linux-arm64.zip")
sha256sums_aarch64=('8bac31e68b2cb959a038f525e16497090e89cadf92ce6b113e1685fbca17983b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.46/opencode-linux-x64.zip")
sha256sums_x86_64=('24dddc88b0033234eab77b718ae74a4ffb2e4c77d4f047413cba870873e08c9c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
