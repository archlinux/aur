# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.98
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.98/opencode-linux-arm64.zip")
sha256sums_aarch64=('99b68e6a6aa4d3021dbe8ac6195bf922984a1c0c49c54b7f305a7ce76dbd5edc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.98/opencode-linux-x64.zip")
sha256sums_x86_64=('a2d87bc01198b4c9887eb569c97280ec9d8aa53949e83bd5ce54a8dffc87b05d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
