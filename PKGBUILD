# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.206
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
sha256sums_aarch64=('a51de5e446caa4b24e0c2d19af7dd4c98f77ec53e5101961b93c839551dcc99e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f5e8a9ccc961f1797abad2dd164265fe5849bc1c4aef3e63609c210830c07baa')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
