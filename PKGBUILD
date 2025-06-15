# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.46
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.46/opencode-linux-arm64.zip")
sha256sums_aarch64=('4e4dc3cdef2e9295cdb62f1a245aca456d3dfffe6b046f165effdd9eaaf86ce9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.46/opencode-linux-x64.zip")
sha256sums_x86_64=('47a8ecf94c07a77c82514b356bdf1beef184e58c910e103b7c8a05ade699d5c0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
