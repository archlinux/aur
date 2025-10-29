# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.26
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
sha256sums_aarch64=('8ae720c14ac11a2080e4b37de8c28e61e5a79da18d9b98e433369fce129cb6ba')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('9bd89a22f0cb283974bd950d2717dfb1b2889bda532414c22a283f8c6cd7e113')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
