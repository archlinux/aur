# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.14
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
sha256sums_aarch64=('41d0ba7ebf8c2ef1b23751e9588f62ed7a6d7ed387dffa611299f4b5fc66c004')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('278e72afaab7f27c3a1aa332e468252229112aa06a673fe368a94a5b478d0ec4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
