# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.49
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
sha256sums_aarch64=('fd484fad0849b3c1ed0220e4d3bc87f1d6537463feaedf7014d1fef5266cc4f6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('50aa3e3f2c4b746bd4a3c4fb1f4f65625b4b2f83e70bf2cf73bec2b9574e9cd8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
