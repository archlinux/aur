# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.125
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('16388a82887f51e34ff9a2ba549ac426d0071e02c2bb82374fa9b971edf78d31')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('c6b7d60a6dbf9448fd5dc949589b460d0536175b35e80dfd12a474f50c8c05ad')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
