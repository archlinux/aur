# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.104
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
sha256sums_aarch64=('76a9fdfbef0b9766644505f0d4632f4a38796abfc90f843278253c4abcb3a696')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d58708dc49f0a48189a35869ce0a60965a3c05024cb98b6112ca52e82ab3876c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
