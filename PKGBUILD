pkgname='swisseph'
pkgver='1.77.00'
pkgrel='1'
pkgdesc='High precision Swiss Ephemeris developed by Astrodienst.'
arch=('i686' 'x86_64')
license=('GPL')
url=('http://www.astro.com/swisseph/')
depends=()
makedepends=()
optdepends=()
source=('http://www.astro.com/ftp/swisseph/swe_unix_src_1.77.00.tar.gz')
md5sums=('62ec933bbe7dde6a96d0b363ca1e18e3')

build() {
    cd $srcdir/src/
    make swetest swemini libswe.a libswe.so
    install -d -m 755 $pkgdir/usr/share/swisseph/
    install -m 755 $srcdir/src/swetest $srcdir/src/swemini $srcdir/src/libswe.a $srcdir/src/libswe.so $pkgdir/usr/share/swisseph/
}

