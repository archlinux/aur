# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('31da1665e8f05cc516ba792db23006f688b467c4231aba2a89dd99ea803d88c0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.1/opencode-linux-x64.zip")
sha256sums_x86_64=('7ae8d0b2c6fc15081eb79f1e0fd4ecb4ce88376ac7ee05a952bc7be001733f7c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
