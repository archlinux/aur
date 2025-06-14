# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.44
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.44/opencode-linux-arm64.zip")
sha256sums_aarch64=('10ae127c5f3e7ddd669c84a087f2d7dc40e717c3e9b0a87015826d9adbed0868')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.44/opencode-linux-x64.zip")
sha256sums_x86_64=('3561541a8c56cb1c1d71e8c8de300b89888aec1d7226159c852946df5ecf442f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
