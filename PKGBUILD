# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('cdc0fab13ad77063311c87a6b9bd4dbef749cb482e0d19fa15ef2d0cc4451ae1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.0/opencode-linux-x64.zip")
sha256sums_x86_64=('1c3c0480448fec92f8986316f0c9c5c2be88c17d6e9ac53355f8bab896dd4436')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
