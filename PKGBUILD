# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.22
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.22/opencode-linux-arm64.zip")
sha256sums_aarch64=('171a5f974831ebdeab715f63bde60ae2a213765dbbb0304ecc8bbb09945a4e47')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.22/opencode-linux-x64.zip")
sha256sums_x86_64=('270615f0a91fd1ec21dbf85c78808bf58c1821e100e27b306a916fc9969d87d8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
