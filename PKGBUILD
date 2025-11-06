# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.31
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('f399f4ed14b4aba83a6b0e960dcc586b35d136bdb6125b32b6d452826fc9bbe5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('5cf344f07801f1d3b73cb8dab6ec195f5d5c866538a8457ca2d41f67ca648517')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
