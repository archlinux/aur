# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.23
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('ee7ae89d028cbbc5ca2307ed15d6acf3056725d8804823ae5204ea8ee567bd0b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('602558ad65b6fc9452e1413cff7b363f4a5e62b31f6c7e4336f053b2065eb0cf')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
