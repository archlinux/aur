# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.147
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
sha256sums_aarch64=('8842415b4cadbd032f2407def90875d908f57513006e8238e697ebfa4b24b88d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9fbeb7a1ebc3dbc08196cf84ae885d3a4108f94f74297ce86574a8dcb698c402')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
