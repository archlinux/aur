# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.109
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.109/opencode-linux-arm64.zip")
sha256sums_aarch64=('74d16c7a2da732e17c16872d0fca1f1fbe3c2be751feaa89a8ed0478f16c1aef')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.109/opencode-linux-x64.zip")
sha256sums_x86_64=('8c67caf49f0539405d36880eae8c8b4590ef9b81e00de03ce68b9077d1298655')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
