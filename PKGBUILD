# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.34
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('bbdb3f00c2c51e42e315525233151309724226a8776da8e9145e3b0fa3d5310f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('0f22479647226d1d2dd99595d20082ee7bda3870b62dc6a90b41efc1a71d7e9a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
