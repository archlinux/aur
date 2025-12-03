# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.129
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('49615141e4268539cccbed9a6ea79ad77dd993799dd8a942d0b2b31256a87afd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0f626e9f8c195484b22084323c9b5d0d96985a4646f7d1fccc7bdd1f7ad146e1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
