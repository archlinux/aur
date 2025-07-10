# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.19
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.19/opencode-linux-arm64.zip")
sha256sums_aarch64=('b5e25edd5955b9e171b76cb37e7d3096753b592030aecce01fd767ea4e11a720')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.19/opencode-linux-x64.zip")
sha256sums_x86_64=('efdd498d94a2aea2dcf7ffc3871fb698e803d979b02f6e8b6278475aec736a3b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
