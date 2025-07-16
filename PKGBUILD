# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.17
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.17/opencode-linux-arm64.zip")
sha256sums_aarch64=('5a375f94503e3e168fd4176f5554f8d2f69154a536cb26649c0c7ffa38322d40')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.17/opencode-linux-x64.zip")
sha256sums_x86_64=('12f898e1746869b08e6dfd8155b732ecb9485e8d93ba4d7e6b93d80e4a92fcad')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
