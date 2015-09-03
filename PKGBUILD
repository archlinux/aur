# Maintained by: Zeger-Jan van de Weg
# Contributed: github.com/orschiro

pkgname=netctl-eduroam-uu
pkgver=1.1
pkgrel=1
pkgdesc='Example netctl profile for eduroam at the University of Utrecht'
arch=(any)
url=http://www.uu.nl/university/utrecht/NL/praktischezaken/ICT/Paginas/Eduroam.aspx
license=(MIT)
depends=(ca-certificates netctl ppp)
source=(eduroam-uu)
install=install
md5sums=('0008f47b858ad98a511b10694a1a534e')

package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  cp eduroam-uu $pkgdir/etc/netctl/examples/
}


