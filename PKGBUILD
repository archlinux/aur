# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.142
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
sha256sums_aarch64=('6e46484c4f8364c1c03dc8a2e3c11961c7f017e39f4cecf56366987a76d2db2d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2fe46290db5c6a9e7ea1fd39b64e96678b438df3a6e57e970de25f2413306b08')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
