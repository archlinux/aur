# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('c0159c4700458290549c32ac133c949267b228918f624c976d57bbc5ae2c08fb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.1/opencode-linux-x64.zip")
sha256sums_x86_64=('364efa2cc881cc0edc18190c943f90c57511ed5bf2d9394556f29fd657495709')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
