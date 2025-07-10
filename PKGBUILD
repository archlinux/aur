# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.26
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.26/opencode-linux-arm64.zip")
sha256sums_aarch64=('b5da36429ea9b344a6ccfb418a7d1351e29714cac4549485f668e2a2f034b680')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.26/opencode-linux-x64.zip")
sha256sums_x86_64=('d3a86017502858c0b486af9128d16e975e3d6c66003de2ef7c99d649857e6500')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
