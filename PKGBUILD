# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.64
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
sha256sums_aarch64=('517d54b10a0ce1d49e0da2c3c069f3d007b8c2fffb1a3e988f514ee01831febe')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('d6eac489a995c3fe3b2fee3f2dbc5bb2fa77004d8f4f25255cb2068af71087d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
