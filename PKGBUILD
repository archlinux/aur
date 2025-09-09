# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('6de0fa625317ce7a3461a286f0b5e6aac20bb67628dcbb61446f847934c87fdb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.9/opencode-linux-x64.zip")
sha256sums_x86_64=('272bdc8eb0d04eff2206bb3353926d753ea8cc3a9a73a9caba1148b518919043')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
