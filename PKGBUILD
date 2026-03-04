# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.38
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
sha256sums_aarch64=('97cea2201983bd514352895e862eb3ea786aadb2d4f41c39390d0614edef319a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('622dda11814e21031f5b3488bc9ac571105812dab4a33db20ee78e7a699d7caf')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
