# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.106
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.106/opencode-linux-arm64.zip")
sha256sums_aarch64=('26d59059c4a8af4b0da847d11ba362c6b4b8f4109541e173da77f722662ccf2c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.106/opencode-linux-x64.zip")
sha256sums_x86_64=('51b7d568f3fa7a61bd020c291a63a02a51532821752175a2be0df8ed1dc351dd')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
