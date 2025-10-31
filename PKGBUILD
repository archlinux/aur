# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.31
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
sha256sums_aarch64=('f5c319ce4efd847ac1cd263efa312dde2772d0e9e2a35c07935979fccdb31b84')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('9e8cf2146f767894acc3a7739f2ba03139d5cdfef240246515389019d44be787')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
