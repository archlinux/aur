pkgname='swisseph_18'
pkgver='2001.05.03'
pkgrel='2'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (1800 AD - 2399 AD).'
arch=('any')
license=('GPL')
groups=('swisseph-all')
url='http://www.astro.com/swisseph/'
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/archive_gzip/sweph_18.tar.gz')

package() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/*.se1 $pkgdir/usr/share/swisseph/
}

md5sums=('5c11356dcfdc3a390497a454c20701c2')
