# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.83
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.83/opencode-linux-arm64.zip")
sha256sums_aarch64=('dab61e102505bab46729978bc1826f29c55ee961916dcc6a4970cc92d6829ff2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.83/opencode-linux-x64.zip")
sha256sums_x86_64=('86012050c3d45b1208b4d6f20e21fb943e1a9494657fd73d210d689f24c3efd1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
