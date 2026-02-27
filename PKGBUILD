# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.32
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
sha256sums_aarch64=('45e015804bbdb2e7337f2674ce21af73d8d9ca0c75e41510f8e30415c33c03f5')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('4098daf90340f620a4fbff4e2086cad7cc4f44cc8b264dde95f637124f172296')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
