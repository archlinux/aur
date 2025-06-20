# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.114
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.114/opencode-linux-arm64.zip")
sha256sums_aarch64=('5ba9135f857e4186d3cbf4b753e492fc784a6ea5fbb535176bf33381ff7c77b4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.114/opencode-linux-x64.zip")
sha256sums_x86_64=('d0bdf7545734d5f19a8372addbe5b8050b3a54e692fa0f233cd1ffda7925d776')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
