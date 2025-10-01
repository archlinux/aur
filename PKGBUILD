# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('6b3b0fe75c1fede8f48df952c781c919ab3c50610d765c84706a86071dad4d0b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.7/opencode-linux-x64.zip")
sha256sums_x86_64=('d9ffb9450be52fc87fc054fec659ec797e374ad32ce34331bd7167a7cc516b7c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
