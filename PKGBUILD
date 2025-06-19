# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.88
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.88/opencode-linux-arm64.zip")
sha256sums_aarch64=('dedeaac194a29a7e31d6671bea8e0e23110b30020758f7fee0df51d2989d1ffb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.88/opencode-linux-x64.zip")
sha256sums_x86_64=('604b1304654562795af5396c5e8d54c290d7b89418956f78811ada386dea9b1c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
