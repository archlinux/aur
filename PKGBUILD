# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('55e407f841de3d3bc086fed6197618d0ba7a4045815641614fc4a9f4302e77ee')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.2/opencode-linux-x64.zip")
sha256sums_x86_64=('330217f2a9c2fc8945f3b795b21143102fcf31bad2357e85599cc24942f43555')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
