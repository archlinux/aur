# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('8077e59c57fa4a32b2590576ef606078f00db21296044cc0c46bb6f01fe61979')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.2/opencode-linux-x64.zip")
sha256sums_x86_64=('813237f96da6cc7b72e17159cd10684a2bad95943297070cca4d53a684263ecc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
