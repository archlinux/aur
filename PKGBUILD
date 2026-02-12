# Maintainer: kilo

pkgname='kilo-bin'
pkgver=1.0.19
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
sha256sums_aarch64=('2900dadf63d3a6dfc812ae22f16ce20cb2e04f0cb77e4587ff77a8508aac3cca')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilo/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('c1406bf9ddf973c1a8b38ca205dfe7252395ecdfb027a9b4b9d2c99b4d2a1f95')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
