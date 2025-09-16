# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('a790c4670b98709ad6ddadd21a0e2d447b2783ab568e73c7553a97a37a1fa2d0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.2/opencode-linux-x64.zip")
sha256sums_x86_64=('1746f9e5adf7583ee2ac724731feca8a394c6dad8606c8cbe0dfc3ccb235fd7d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
