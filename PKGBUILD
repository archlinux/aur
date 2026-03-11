# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.0.44
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
sha256sums_aarch64=('67081c32476ddbb5cd90ba7ca15ae07cc41d49fdca61dd5af58c50c568895f40')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('ca2f25f1bb0e42a06864ae9f82a3367ebaed44afaa0212698e7a6cd361912aa9')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/bin/kilo"
}
