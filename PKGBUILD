# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('91228bd1727580b76590de1fd97e4fc8867052700a314e28285de5edc049e572')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.3/opencode-linux-x64.zip")
sha256sums_x86_64=('2273476fef87c9630fbad695c63a452709b490f20ce38d6031615466da266d7c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
