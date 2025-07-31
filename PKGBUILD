# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.105
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.105/opencode-linux-arm64.zip")
sha256sums_aarch64=('a2bbc69e7a2f53ef9fb6d4014e209c487374df5c3d4ece63ba3f6c5f4d030f6a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.105/opencode-linux-x64.zip")
sha256sums_x86_64=('536b80b05666f83a4a8554008901a18bca977e033edc8d7ceb33ab64ad22b249')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
