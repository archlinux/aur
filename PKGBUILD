# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.92
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.92/opencode-linux-arm64.zip")
sha256sums_aarch64=('8a3236aa1f68b85857cc850ca7e96131c98c505e855359ea4f69d0ee52d5a536')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.92/opencode-linux-x64.zip")
sha256sums_x86_64=('44e55402fa5373a5a548d3ff8db273e8d83782733feb8e7ac8e8c0fca4ead738')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
