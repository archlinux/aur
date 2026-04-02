# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.18
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
sha256sums_aarch64=('46635cff219b79ddb267935387e6b5340ec3b23719e8c72d2f6ad8262e933bea')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('a2134b15d9e5202f3d45082e895df50f354f3d1b8ea8305cd88a606c31a87a86')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
