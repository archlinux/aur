# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.22
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
sha256sums_aarch64=('257289d1e4b7ebb1dbafe8d55b864c953109b8993d5efd4e8c6e568ec8426b8f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('eb21d88a7b34a5f7812aabe2c12baa74dee48b392ce4c83bb19141583df09790')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
