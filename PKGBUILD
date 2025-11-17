# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.70
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
sha256sums_aarch64=('65ad523b7e9e43984cb9fb2cad1bd836ceae75a10a4a2266b6989e4529db89bb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('791ae89de1a47f11be84849dc55b88f991281edf5659b3818b5329e9bb817a23')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
