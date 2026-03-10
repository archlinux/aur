# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.43
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
sha256sums_aarch64=('2b20bacbd98988721008338f4a064bd908b017cab54713c5f77da9d2f2a81a1c')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('101ed9c0fbe9b20a312366122e2b429d467b277dde96f6a3a2258b8c25dbbc19')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
