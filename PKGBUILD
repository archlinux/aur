# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.55
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.55/opencode-linux-arm64.zip")
sha256sums_aarch64=('6b1004e77bef59c559bcde3937c751d83fd9e5fa1c85a7b7cd04c232e0c24e40')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.55/opencode-linux-x64.zip")
sha256sums_x86_64=('6fa57f254c2018bab82e5608652f970520341202d458631445c01c03d0f83434')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
