# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.19
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
sha256sums_aarch64=('de4f4ee3bb0a2ebfae36a6618f4aeea6462ab7a23c6704d2b399313dfb73b0eb')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('f621af61f60a72501c110b0aebd3acc40fb06c625d060fabe684fec0b1286ae1')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
