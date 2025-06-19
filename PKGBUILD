# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.97
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.97/opencode-linux-arm64.zip")
sha256sums_aarch64=('d9feb42ebb9258a801e1829f911b9d0d40307d3d53f251ac9adc8f8f8dcd3e33')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.97/opencode-linux-x64.zip")
sha256sums_x86_64=('ad4996de896c2d440578acb9d65ee7bfc81f08dbf952f0fa9e85aa9989348b22')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
