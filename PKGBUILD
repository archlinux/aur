# Maintainer: Pieter Joost van de Sande <pj@born2code.net>

pkgname=pc-nrfutil
provides=('nrfutil')
pkgver=6.1.2
pkgrel=1
pkgdesc="nrfutil command line utility and the nordicsemi library"
arch=('any')
url="https://github.com/NordicSemiconductor/pc-nrfutil"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=(${url}/releases/download/v${pkgver}/nrfutil-linux)
sha256sums=('a384e3eb09133054e3006af2033bd497f466a0ae4c2a6dd75e895afaad3c53e3')

package() {
  install -dm0755 $pkgdir/usr/bin
  cp ${srcdir}/nrfutil-linux $pkgdir/usr/bin/nrfutil
  chmod +x $pkgdir/usr/bin/nrfutil
}

