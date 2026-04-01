# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.1.13
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
sha256sums_aarch64=('36d622fc03dd00cebbe8ec5aaef1462d94d665b960f40a040d49b52a662935be')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('4ca2cc72fcf290bd000661f62233be33b30f4ee39b3b74bf0c68ec675d00bbc8')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
