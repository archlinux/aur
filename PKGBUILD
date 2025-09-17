# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('1bbda253d99fb0a1d19699f6d1332e79243844db9367c0105221a22a39f500af')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.8/opencode-linux-x64.zip")
sha256sums_x86_64=('a9985e5b2285fcccf478a3d5bc8421596273af699b73d396bc40fe3ff79360e1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
