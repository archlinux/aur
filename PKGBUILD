# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.48
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.48/opencode-linux-arm64.zip")
sha256sums_aarch64=('3dfa5ab085b62fd21eacfcb586f8b773bdf9a4078067abef1cdcd18c37958519')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.48/opencode-linux-x64.zip")
sha256sums_x86_64=('5997b1cdc9e08ccc6a5caef4acd12f3b24ce1c59ac53813d943a2d9e719c3325')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
