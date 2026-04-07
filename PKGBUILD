# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.23
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
sha256sums_aarch64=('d1a5c50e5f45ef97a6c9abf267d78758a2d185ebf20ee2be88a8377bae30af8a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('187019e7b5fc613f7ac84686c2e7e2a1dc42d9232d73c48d483e9e20065255bf')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
