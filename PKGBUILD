# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.125
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.125/opencode-linux-arm64.zip")
sha256sums_aarch64=('6dfc8266a1ca7511311f94e0f81613df62859cdf3753efd6d3964e38ac9dbf35')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.125/opencode-linux-x64.zip")
sha256sums_x86_64=('e950654f6706677396f5c896029c11939eb4dbd0ea61a43b7ebb6b0567f3fe32')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
