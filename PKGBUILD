# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.70
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.70/opencode-linux-arm64.zip")
sha256sums_aarch64=('d5d66bad5c9ee9b23e06db3f5ddfcfb6fd7df727dab5286233df5cb9fe94cd16')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.70/opencode-linux-x64.zip")
sha256sums_x86_64=('1a6883b5be15ac719f98bd14472beac9c03957cf50c33eec77273bb4b4cfb81d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
