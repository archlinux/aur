# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.2.14
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
sha256sums_aarch64=('8d2556157d6bdbb8656aacadc0737c2b813f1d435be56638e607fdbe5bc661c2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('6051a1be708f7a82167a441249e211c66b202c3b8f4005bd22b409d3b481f0da')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
