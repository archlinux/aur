# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.161
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.161/opencode-linux-arm64.zip")
sha256sums_aarch64=('06fe1fdbf55cc28e58a32c373e1e7aa623d0a864eb7845f315caf5d74a037ee9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.161/opencode-linux-x64.zip")
sha256sums_x86_64=('41d82d7a912fbe4827af4a74f196eb937222c5178da324400a503ffa2851491c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
