# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.120
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.120/opencode-linux-arm64.zip")
sha256sums_aarch64=('5274a38835a1b399c179edc9ad09cc67a41ccd3f86934e3244d6e2b599190831')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.120/opencode-linux-x64.zip")
sha256sums_x86_64=('6672f6dc84510d42867d5ed5e893e2cf9789d6ba3b22378a43a2c98defd196e8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
