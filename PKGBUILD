# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.15
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.15/opencode-linux-arm64.zip")
sha256sums_aarch64=('aae7ffa8bc4e2b944ba6c139743fd0f384a45efe9a1213f2fde7c72d08a1d9fd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.15/opencode-linux-x64.zip")
sha256sums_x86_64=('7fcd0c6cf420685fc7b4c134f2946c4f6d6a8321f98d27f2f036fa175ce00631')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
