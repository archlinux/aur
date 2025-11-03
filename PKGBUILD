# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.16
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
sha256sums_aarch64=('41c8cec52138385f88db951f19eac1db1fb0b0769b17d2094c01083ee5169880')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('5cfc5510439715807748af5b6ea0cdd1702b20c80e5e1965f8ed5df240612e48')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
