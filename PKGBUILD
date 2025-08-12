# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.24
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.24/opencode-linux-arm64.zip")
sha256sums_aarch64=('522869ef5b91475b8e88a282ca784f073ef6a0184c3b53afd72cb040a83df83c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.24/opencode-linux-x64.zip")
sha256sums_x86_64=('0dee37ab22e9ed20aa812286ef51641f7ae9e35741b53f4293a5774a2afc6bc2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
