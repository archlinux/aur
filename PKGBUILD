# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.122
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.122/opencode-linux-arm64.zip")
sha256sums_aarch64=('4b80d2e89b338610777353156182595171a181fe9378e29aeb759604db64d4ff')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.122/opencode-linux-x64.zip")
sha256sums_x86_64=('a0f32b09316e027bc36f45fc228d8d03c1e47c2552ea5c86a38d3185994d2116')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
