# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('bcd2897c8ec08e3d023a90711c510283381ac2fc004f532271c02e28b3b73b57')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.6/opencode-linux-x64.zip")
sha256sums_x86_64=('69b77f4a639b35d40217b3a883be17c39cb95bdf9d2a4e338892ef8bc4c04c9c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
