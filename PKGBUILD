# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.24
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilo'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('19a496878465ef456e3e76292e83e1ffc41cb0fc22d5fc1e2c091caccdd2dd26')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('c0100673ace7d2476d68b6284aabc1b5c134b949634b3a0205d2b23eed8ecf6c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
