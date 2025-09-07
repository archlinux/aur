# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('55643754419ac3d2a577a8453850e80747be3b23fd95f81f714896daad9e3600')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.5/opencode-linux-x64.zip")
sha256sums_x86_64=('8cc8c26a5abd89dae36204b2f1d63f95aa501b662febf1c2a90e046761c066b2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
