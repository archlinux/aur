# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('5579e7ae8baf92394c9e6906d2d4f82c8f854b111135bdf4a0f87af2f108b6ac')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.5/opencode-linux-x64.zip")
sha256sums_x86_64=('f05bb6feb3ac045d7a1cbefd0d2614295e37980e8da744d41ce18151ddd93177')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
