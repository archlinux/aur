# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.109
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.109/opencode-linux-arm64.zip")
sha256sums_aarch64=('b1eca4ec04071302d2c2b85ba15a23f9e6678cfca4bf5fa3a409178ac472608e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.109/opencode-linux-x64.zip")
sha256sums_x86_64=('6ad22bb307750c30f0615ee45a43e157da12f58910d9d24824a9cd1757caed7c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
