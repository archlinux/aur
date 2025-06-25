# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.136
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.136/opencode-linux-arm64.zip")
sha256sums_aarch64=('154a92262825b1f6ea65866bfd1f4eda24110f279dd55acd39171adfc9819456')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.136/opencode-linux-x64.zip")
sha256sums_x86_64=('2b894c21d1568debdebbe03ce60dbc8a896abfc3f3e6a9b47917d04648c5eb00')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
