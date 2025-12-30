# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.209
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
sha256sums_aarch64=('448fe405f2217ac26094c57bee0393cea6c12726e2705a9a63926b8b3fd01fef')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9c0fa3d39e1c60fd5fa2e82b3a2f98408d65bb6d13a0303ca79b9821b8368148')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
