# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('196aca1f67691914eff8615ecfdc335aeeb106d02e5f05fe9445e88806d80cf6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.2/opencode-linux-x64.zip")
sha256sums_x86_64=('0a7d252c487c090dcd72ad6fda545c167ea5447f368121978a0108f8f1ba403d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
