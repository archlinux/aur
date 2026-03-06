# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.40
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
sha256sums_aarch64=('0eeaaba10aa5d01d73f25eed65838f7d866a35b10596b9e3f12b65eaaad47471')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('94ed9a13542deeb552779df9b1bf805a196b01d33d44bd40cb960ae42354dce9')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
