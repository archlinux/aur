# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.119
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.119/opencode-linux-arm64.zip")
sha256sums_aarch64=('dac2d43a2a8205d3f76412a7d6069479fc2ede820a8c06309a677f03258ae519')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.119/opencode-linux-x64.zip")
sha256sums_x86_64=('07cc793a1b4db140fae8ec3f003e9c38e5347ff09fde7149fee2f022c92354d0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
