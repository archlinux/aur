# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.78
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
sha256sums_aarch64=('9757bdbfa58cfd425edc3276510605ba35d260cf707de46afddab4c82b8ed799')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('1ffa655febd73000b858037e3b051066e6c183fee8b307ab6c1cce7d1968530b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
