# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.138
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.138/opencode-linux-arm64.zip")
sha256sums_aarch64=('9088018fe89ef6a1ec5d8a777874ed0bd98ac64904078b16fc59ceb78211a9a8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.138/opencode-linux-x64.zip")
sha256sums_x86_64=('381ed725f85be51a1426cef154adf702fdcc5347fb8858d40bedfcf513e6a2f7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
