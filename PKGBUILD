# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.0
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
sha256sums_aarch64=('86e70db710cf1dbf64361bafa50eca66a4a46a30bf66eee99d7a8c0e0c5cf2bc')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('813b24d2b5be05dc768b43acd1bb7bcca3115662585db2e24f56d8309a2bed7c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
