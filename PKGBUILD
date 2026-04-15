# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.10
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
sha256sums_aarch64=('630a7643981a62f35a301aeb065d6b519c44d270dace839e6892a68d3e7616bd')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('64a37e63cce7e9a22369391a8507cff17a954992126613652cabe04257e139ca')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
