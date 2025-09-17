# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.9
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.9/opencode-linux-arm64.zip")
sha256sums_aarch64=('eeeaff39b968ae99cca54bdd3fa47accbb83d185db5eb0bd8f15d6a891ab9142')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.9/opencode-linux-x64.zip")
sha256sums_x86_64=('8893ebf3e6049a7fb414eb8cc58e1b908f99612244f74cfe6fe6ecaeded0ac32')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
