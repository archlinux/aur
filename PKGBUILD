# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.121
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.121/opencode-linux-arm64.zip")
sha256sums_aarch64=('81a6d73da543c60695a6195c2f5d42c24d5e16dd981afe7d4dbc89d8944838eb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.121/opencode-linux-x64.zip")
sha256sums_x86_64=('1d218dce26f092abbf2f5bb54bcf7596efeed0180798d68267ae0cd186b58f6f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
