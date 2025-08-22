# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.16
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.16/opencode-linux-arm64.zip")
sha256sums_aarch64=('8a052ba969439be6930ae04685fa09bfb9da5cf65c4bf6c9ab89fccb24e867da')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.16/opencode-linux-x64.zip")
sha256sums_x86_64=('ff7764ee6d4cca1436134522e3a5c3c1661a71cc871259c96740638e211c226f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
