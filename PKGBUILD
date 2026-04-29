# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.31
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('876e9ce05447ee0d3d7ec5d2a48592dd2149a3b2e394ee2f42b3011a20b9f180')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('975f115b78756c23afdaf75cf2134f5ad636eb69f0dc64c6756f5def4b69f881')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
