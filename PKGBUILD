pkgname='swisseph_12'
pkgver='2001.05.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (1200 AD - 1799 AD).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/archive_gzip/sweph_12.tar.gz')
md5sums=('b5e23c2bba2c0d5d54d925f46e635d74')

build() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/*.se1 $pkgdir/usr/share/swisseph/
}

