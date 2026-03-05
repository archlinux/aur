# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.39
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
sha256sums_aarch64=('ef2e40594f42cb29aa71b6e88a5a504a0875f6dc1db918572a6c5c8a88adf752')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('963b6475482eef903dbf398c25d0d585dc87f3eeb0a8a12ea67c9ee1c5670f8c')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
