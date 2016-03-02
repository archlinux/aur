pkgname='swisseph-fixstars'
pkgver='2012.09.10'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (Fixstars).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/fixstars.cat')
md5sums=('126e710e2a5da180789cd82c3c181cca')

package() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/* $pkgdir/usr/share/swisseph/
}

