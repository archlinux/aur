# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.84
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.84/opencode-linux-arm64.zip")
sha256sums_aarch64=('bd60fcb9dbb0c9078f04f76478e47dac875fcde6bdd89f9da99543e25b46cbc6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.84/opencode-linux-x64.zip")
sha256sums_x86_64=('b75ed02bfcfc5d4ebf9c1dfc1056a1fab95629f1765218d447fbaef80cfe920d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
