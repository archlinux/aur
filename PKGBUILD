# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.33
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
sha256sums_aarch64=('865baf53c8be7543689efe58260e6cac4bdacc6cedc88000d3cc36a469055787')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('9184f171a229ea94eb981a1d669f363cc1ca86dfc0ae54c56975677a09d9756e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
