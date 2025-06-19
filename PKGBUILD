# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.104
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.104/opencode-linux-arm64.zip")
sha256sums_aarch64=('0c460017f9463b48cdca1628ce4eae37576ffd75f516183c44473ae1fac8b699')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.104/opencode-linux-x64.zip")
sha256sums_x86_64=('97a09a99c87999c4d0dafdf462345bdfcb74f8700de80f709fa310286ac7d16c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
