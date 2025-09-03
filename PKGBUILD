# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('4ea40f48ec9b72870be4781b8ab744e37d7db73e74f12bfa981262b7a2e95e2f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.4/opencode-linux-x64.zip")
sha256sums_x86_64=('516a3f7fc947bbf8411c34250ac6d81b7d88c786efd3d3c4b3750e77a7a58571')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
