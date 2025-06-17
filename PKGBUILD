# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.66
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.66/opencode-linux-arm64.zip")
sha256sums_aarch64=('eddcbcc0bca880da5ee0400c2ae2e9de7a206b9cc69533e6fa1ccf497e7cbf7f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.66/opencode-linux-x64.zip")
sha256sums_x86_64=('b4e025e42a00cc0352c592774eeb2c6d739ee4507b87a63d6d3f8a8fb31f7eb3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
