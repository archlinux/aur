# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.28
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.28/opencode-linux-arm64.zip")
sha256sums_aarch64=('fd09d9b201b38deeac3c0ee449092b08ab1c8eb051687b2f4a27798454edb69b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.28/opencode-linux-x64.zip")
sha256sums_x86_64=('81aa4cc994326faa791727585037741eb0d050580b04a46c091a974eb8b02513')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
