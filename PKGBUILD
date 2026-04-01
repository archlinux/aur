# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.14
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
sha256sums_aarch64=('91caf327ccf7adfaa0f03dd123c5bae2018b209cfb51ff1f7e51f06432895628')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('44f926b7b2f4383862e37edc74ec404325eea56a53c0913fd08e06d82cc8c54a')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
