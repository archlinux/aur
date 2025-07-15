# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.11
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.11/opencode-linux-arm64.zip")
sha256sums_aarch64=('84883e34ca5d30613648e184faaa4e266b8d4b76aea5c9df32e8c97c2a51dce3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.11/opencode-linux-x64.zip")
sha256sums_x86_64=('555d870e0456de50c750718b4765cc825850d19e25c95bd71b4c1ed9295a6957')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
