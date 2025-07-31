# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.88
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.88/opencode-linux-arm64.zip")
sha256sums_aarch64=('a6a4278e1255ac0e221224748fd1501b46772db353513506f913d760f2d15eb9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.88/opencode-linux-x64.zip")
sha256sums_x86_64=('1bd242f037b6192140c9683a3a894070052b31b3f4c865521eee6399c6e50753')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
