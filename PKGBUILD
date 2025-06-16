# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.59
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.59/opencode-linux-arm64.zip")
sha256sums_aarch64=('4bcece4c94845ccba27e51be310f5b3c3143be40b38e303df5874b2313d11470')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.59/opencode-linux-x64.zip")
sha256sums_x86_64=('895f5bc275273d790b326d5ebee2a46728e5f53e1443a75b044a2fc4958b8c73')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
