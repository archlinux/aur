# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.145
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('66bcaa295e8db4a8f77e6c96045db6da0dcf31bfc781fee175dcbbf67bdeaf71')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5e33a94b37865355b8b014c2a9764b8841b77a522dbfee4acdfdef2923225134')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
