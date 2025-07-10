# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.18
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.18/opencode-linux-arm64.zip")
sha256sums_aarch64=('51aa2b09f204418cf513824ca51bb326330789f81e8d317370e41dc1f20509d9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.18/opencode-linux-x64.zip")
sha256sums_x86_64=('1183c1bc270d649610c483a91e14ea312a7fe1ada7b12b6f21055df01050c710')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
