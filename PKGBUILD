pkgname='swisseph-fixstars'
pkgver='2006.03.03'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst (Fixstars).'
arch=('any')
license=('GPL')
groups='swisseph-all'
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/ephe/fixstars.cat')
md5sums=('19d2486e8ba2abc9109692c403430f3f')

build() {
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/* $pkgdir/usr/share/swisseph/
}

