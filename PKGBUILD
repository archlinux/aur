# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.29
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
sha256sums_aarch64=('434beabc923c6cdfaa451be2a01bb2e854d02ed068d98ef0daad51f324fd2e55')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('d8c9dd677b1bd4209e37d120a221a0a9fa570eaa94642041f7b3aea02ae1f282')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
