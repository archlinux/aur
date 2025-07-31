# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.102
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.102/opencode-linux-arm64.zip")
sha256sums_aarch64=('8cf68e834050e008c1566202eeb7dcc87e9b90d33d38b7915a59c64c08d43e39')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.102/opencode-linux-x64.zip")
sha256sums_x86_64=('5399fc74cdba5d42605fed762f8b2bf9d898dc00524f6213a97dd2a9d3aa86e6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
