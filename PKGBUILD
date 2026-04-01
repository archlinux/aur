# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.17
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
sha256sums_aarch64=('418fc3e844ff38a3b608f27e856d728e1ec5b3a01db74a0b1eb7c01b5a7e6350')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('f2ff9981f186548790bd074cda52c0500350e31e11a490d535c573877b846e3f')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
