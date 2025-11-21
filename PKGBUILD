# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.83
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
sha256sums_aarch64=('159a249efb5194fc86dfbc183456155d201fb360432119c696b79191dcdfd3eb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('bded0911d1fd8c3c6d9f7e1e31dda5af06e9b4cb1b929e1b093a3675087fff93')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
