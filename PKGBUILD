# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.91
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
sha256sums_aarch64=('58015356ab75dbf4f9c4c1c7936c4d898214657cf21f8172cb59fb34e6aac4c0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('8514a8a3313725fe3ffbd5afae071e6442fd2855917910e7d5866fdf7d0bbab2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
