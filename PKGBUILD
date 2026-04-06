# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.22
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
sha256sums_aarch64=('330aca50f64c688bc9f0be0b4f419335ffe42777083c02f8ea75bacb014bc064')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('6445fbde88f68ef158f796fdd01f28fc62e6ba604af4339de66a64e81792d802')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
