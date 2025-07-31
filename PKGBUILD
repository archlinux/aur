# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.87
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.87/opencode-linux-arm64.zip")
sha256sums_aarch64=('e88d1acd20517f6647d63c31253a67aaedd1c1020191336ee2c29066902feb64')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.87/opencode-linux-x64.zip")
sha256sums_x86_64=('e96bc2526b96a18edd45b99393b3bf443c491d77b6a485c269d4fa310ac24a53')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
