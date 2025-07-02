# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.175
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.175/opencode-linux-arm64.zip")
sha256sums_aarch64=('23d2c1acd53eba23fa84cd3d88ed2ef1b4ec8be099d651e3a1a3ad565cd2096b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.175/opencode-linux-x64.zip")
sha256sums_x86_64=('5595528788d04a3060ddd1f6d1153a9405e3c739bf9bf292562c08d3b4dbbcaa')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
