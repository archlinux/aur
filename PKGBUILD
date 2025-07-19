# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.40
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.40/opencode-linux-arm64.zip")
sha256sums_aarch64=('b8d61958cccb834edc9663d861dbb2609983ff01934036b3536d83713dd5ae7b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.40/opencode-linux-x64.zip")
sha256sums_x86_64=('5718592b65150ebdbd2cc8ec62e01f53d27ef7ec7543c8eb4e0d6091b34cc8e8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
