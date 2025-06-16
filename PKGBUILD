# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.54
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.54/opencode-linux-arm64.zip")
sha256sums_aarch64=('7b5570cbb5ebbe6c6288084ed36fc76589976e849b294189fa1a32afd3bcb6a5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.54/opencode-linux-x64.zip")
sha256sums_x86_64=('0e524903d9d54042b4cfa42b89d7593906ccaa870ba4aaa154b1f17251e54210')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
