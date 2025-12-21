# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.185
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
sha256sums_aarch64=('0578d18ce5ed68c0a016a0118d87f3cb26cd4b1bd76d9158a8e115e5329685ef')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('3ee9c03fe18a562467fc719801e304c34ececfcf168528c4d56b45ba52c7f351')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
