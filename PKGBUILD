# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.185
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.185/opencode-linux-arm64.zip")
sha256sums_aarch64=('fbb4911f0cc95166000cd870e763198cd4177974dca1f6255df18bde5753964e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.185/opencode-linux-x64.zip")
sha256sums_x86_64=('89cf7c5a525686c49bb80e77aed9bcf8c1655426e7205e69fb93c6dc70a2ec51')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
