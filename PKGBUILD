# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.129
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.129/opencode-linux-arm64.zip")
sha256sums_aarch64=('1e804003457eef43dbaa788f5f895026490fa21e681c3522ce72dc2aeb4ce6f3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.129/opencode-linux-x64.zip")
sha256sums_x86_64=('dad2b923acbb648943553499e57f17b71932a9b293b86c6f8c278c4f2e15be44')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
