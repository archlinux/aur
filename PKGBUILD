# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.122
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.122/opencode-linux-arm64.zip")
sha256sums_aarch64=('6f287b2ed15e2abf7f17041d96ce9f13a37742f10c6da54f21b33c3d6d85abb1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.122/opencode-linux-x64.zip")
sha256sums_x86_64=('382942abd1232640751a0c397dc7f5e04de4ab6ebc2c1411052168f5b9807de7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
