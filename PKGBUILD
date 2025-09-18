# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.10.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.10.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('e875ede6fdba4e55fc0a07ab3099deba5552ff48b2934b0f5347c962d1d1d399')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.10.0/opencode-linux-x64.zip")
sha256sums_x86_64=('eb369bc8d8b6585e9cea508a7baf4bc4607a8940273b1db77f932e07df36a0ed')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
