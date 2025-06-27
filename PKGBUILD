# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.152
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.152/opencode-linux-arm64.zip")
sha256sums_aarch64=('1bcc7b8c2bb41a70bea77a82d846436f7ec836069ded180738144485d256907d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.152/opencode-linux-x64.zip")
sha256sums_x86_64=('7e06fe0ea94bcf4d185914771695005da13516881379da7e1377013d7778a39d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
