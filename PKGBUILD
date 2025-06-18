# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.82
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.82/opencode-linux-arm64.zip")
sha256sums_aarch64=('5e471c571022962a11c122f8e42b6fdbb13514beae61cefa0b539eb32e927b67')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.82/opencode-linux-x64.zip")
sha256sums_x86_64=('7672bcdbac6444f8eba76df6fa3adc7d7db2aeb80c885964de45d36d789e105d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
