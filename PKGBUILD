# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.186
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
sha256sums_aarch64=('c19134433ae400f5f5e49d80b66a2733d3399a2d7b187748c8efbc3a316192fd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5e9d8ff665addd639fd61cb046c62cb8d69fe6ef55b411c44644669c95905e98')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
