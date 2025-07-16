# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.15
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.15/opencode-linux-arm64.zip")
sha256sums_aarch64=('91014f9ec8011ea8d09e8a94a7fd622187abce066c61bafd8832b8bbd588f9d3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.15/opencode-linux-x64.zip")
sha256sums_x86_64=('651b267e8bf958066a2060cafb9f13da7129b67323caed91c1eb890529651a88')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
