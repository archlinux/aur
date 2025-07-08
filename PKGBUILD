# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('41010fbb92984a984eb82f692727643b366562ffc1949c031a724d1a5a923c89')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.6/opencode-linux-x64.zip")
sha256sums_x86_64=('9c43d0c1e16043dd946e0da61e2184d5a26569097e82d123155cb30f4b741dde')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
