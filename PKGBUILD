# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.92
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('6616448321b996d8b7365b052d907f8c600672e9cb82b52653956150db2bda4c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b064a891d8a4029f9809367185a62a4420e4718c4085d3a0556908c23e500b87')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
