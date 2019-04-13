# Maintainer: Stykers <stykers at stykers dot moe>

pkgname=ddshttpd
pkgver=1.0
pkgrel=3
pkgdesc="An old and weird http server that uses only dd and sh."
arch=('any')
url="https://git.syskiller.io/Stykers/fonts/raw/master/ddshttpd.sh"
license=('GPL')
depends=('sh')
source=('https://git.syskiller.io/Stykers/fonts/raw/master/ddshttpd.sh')
install=${pkgname}.install
md5sums=('1bc4cf0b6f3045a05cad9e32fe35a435')

package() {
  install -Dm755 ${srcdir}/ddshttpd.sh ${pkgdir}/usr/bin/ddshttpd
  }
