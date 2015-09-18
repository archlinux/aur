# Maintainer: Alexander Straube <Alexander.Straube@GoogleMail.com>
pkgname=sharp-mx-c26-ps
pkgver=1.4
pkgrel=1
pkgdesc="PPD files for Sharp PostScript Printers(MX-C26)"
arch=('i686' 'x86_64')
url="http://www.sharp.com"
license=('GPL')
depends=('cups')
source=("http://www.sharp.co.uk/cps/rde/xbcr/documents/documents/Service_Information/Drivers/sharp-${pkgver}-mx-c26-ps.zip")
md5sums=('907a8bd84dad5535cccc92f477eae1c0')

package() {
  cd "$srcdir"
  tar -xvf "sharp-${pkgver}-mx-c26-ps.tar.gz"
	cd "$srcdir/sharp-${pkgver}-mx-c26-ps/src"
	mkdir -p "$pkgdir/usr/share/cups/model/Sharp"
	tar -C $pkgdir/usr/share/cups/model/Sharp -xf ppd.tar
}
