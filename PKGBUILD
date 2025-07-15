# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('40a1368e262f995d6e6cb9cd15477f3992f5162b81a30f717646c67fc6211628')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.10/opencode-linux-x64.zip")
sha256sums_x86_64=('c2d038191be44dd1f5ec9b05d3261e09c683d6461af8768eddef47cb300ef1a8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
