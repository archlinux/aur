# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.179
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.179/opencode-linux-arm64.zip")
sha256sums_aarch64=('3211ae4840358af32e5c93e69c5909945ec4cc7ef4340061258962d47447ac54')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.179/opencode-linux-x64.zip")
sha256sums_x86_64=('6db5144626d42b58a231d862bbdc0b73d4f3cfb633355601f3400c05adef4ef5')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
