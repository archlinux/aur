# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.50
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
sha256sums_aarch64=('45caf4f7f83ce8c02a2160c703b3ae548586b242e487e1b07dc3d392ef75136f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('51355401531359328995737e6f9bc051672ddf0ac406bf819765202393781611')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
