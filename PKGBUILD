# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.2.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('e156f6a24a5fc91decad54574951b2d8ce1405a22bad24fcc828a66075c24de8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.1/opencode-linux-x64.zip")
sha256sums_x86_64=('15b23795194ee1195831a9a5d8b7e1bdd94c96273df59e77e49924442f786deb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
