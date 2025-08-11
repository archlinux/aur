# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.18
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.18/opencode-linux-arm64.zip")
sha256sums_aarch64=('9d0229704cf889afa89ba9a58053e811bafb5c4d32edc76f396a03754c12e08b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.18/opencode-linux-x64.zip")
sha256sums_x86_64=('1968fcc667b7dabd0c9b215af020cd13e12a056b8ec258074948377161d09ac2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
