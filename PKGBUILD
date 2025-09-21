# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('64e1a7c9dc557d3d1ceaed7046fbc5f8ac9409d6c4b705926375f60701fdb180')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.0/opencode-linux-x64.zip")
sha256sums_x86_64=('8ca750e46408f4c84a8cc5e06fe886135776d36269b44cd4ba8dc05f59f39b34')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
