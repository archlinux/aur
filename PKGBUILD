# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.77
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.77/opencode-linux-arm64.zip")
sha256sums_aarch64=('f3e3a27ad0d7f51ae9bee6a7a4ddf606f37347ab4f80b628e18161d80bb6fcf5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.77/opencode-linux-x64.zip")
sha256sums_x86_64=('ff781a95ca31a209e1f1a4775811a153a82fb4fd15e5f98f541ab7bcf619f689')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
