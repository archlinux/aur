# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('2b8be7c7aed652eadca748ba3a1eeadfa8209ffe57f55bc70bfd8719144a156e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.5/opencode-linux-x64.zip")
sha256sums_x86_64=('6ffe7d42e313bd8a33350bcf6e413f256caccddd1f56d383a184422de5a659af')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
