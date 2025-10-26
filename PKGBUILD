# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.18
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.18/opencode-linux-arm64.zip")
sha256sums_aarch64=('cc10451b9021a0226b645836e3a04d9e66eb1573e5a2a3896b16c68f5e489e00')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.18/opencode-linux-x64.zip")
sha256sums_x86_64=('7f83c10ae9d07b48dd58f5bc36926e949669741794eb8c041f9ab48409063950')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
