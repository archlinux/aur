# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.5
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.5/opencode-linux-arm64.zip")
sha256sums_aarch64=('f9d5c82bb9bad2b5abec351bce3d03a20ff5ccaa8023f1370d4d09c2a752e1a1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.5/opencode-linux-x64.zip")
sha256sums_x86_64=('03decf5c1be79891f382f55813b8f8391220dabd1c1c27d8d056bf8dbb9cbd5f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
