# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.3
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
sha256sums_aarch64=('954f638d540662748a12b675550d39caf3deda42c3a8ef3a089c8dc47d5b1b45')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('05cfa94a353be4f5f78631609ef879143c8276be915a92939e5fbdb7e401c269')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
