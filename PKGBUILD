# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.20
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
sha256sums_aarch64=('85be1d13e9ac4b3f7b03e798e3eee7c913b29ee8c3b7ca55ad300e146a333e78')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('66cbc590ce3b5f63518699c2c6dfda670fdc8c7537790f9f8400798b19360ec6')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
