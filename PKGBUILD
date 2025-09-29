# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.12.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.12.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('2e709ce73895a5d85751238cbd690a9da62c83eafcdbfa1577a760117dbc57fd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.12.3/opencode-linux-x64.zip")
sha256sums_x86_64=('301ef8e31c2dd89a1e8e380e29cfac2f360912d08232cf77925cde86a8cf4d08')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
