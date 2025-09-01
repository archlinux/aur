# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('597a073457a4e15312dde06ded3438be71f16cdec29b3bb8bb3eb30e6cb2a435')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.0/opencode-linux-x64.zip")
sha256sums_x86_64=('30068ccc73924cd4fb4f267d2cb90abc03749f44bc2febc44ca5b2cac23c43f6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
