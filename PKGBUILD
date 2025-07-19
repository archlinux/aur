# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.24
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.24/opencode-linux-arm64.zip")
sha256sums_aarch64=('8d2a82972155270e6429af1a12d78135ef7f196f77e4d0d66b0b234397433c2b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.24/opencode-linux-x64.zip")
sha256sums_x86_64=('13a7c41beb6432429f04e4597b32222f4905911d88081ad01d95b04f7df3faaf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
