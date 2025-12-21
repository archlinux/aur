# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.182
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
sha256sums_aarch64=('fdf95db37cbc727c35899d864569e4f796c7f0de810752f158e95c597fba2e2c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('917cb652c9e5e5d83c7ba1333917f530db743e0ed45c93e904013f2e262c0e89')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
