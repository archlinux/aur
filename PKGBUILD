# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.3
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
sha256sums_aarch64=('36f72dcbceaabcde6aa4ba52ab80ee04d2ef87fb32624a750eb3eed9361f41c6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('d8ccdd28ba0a12fa3aa4bab7da59541de4fe9136e674a845e1beac6d8262b147')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
