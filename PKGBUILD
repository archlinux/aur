# Contributor: Douglas Thrift <douglas@douglasthrift.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=rpm2cpio
pkgver=20040702
pkgrel=2
arch=('any')
pkgdesc="Convert .rpm files for extraction with /usr/bin/cpio"
url="http://www.paldo.org/paldo/sources"
depends=('bzip2' 'gzip' 'perl')
license=('custom')
source=("http://www.paldo.org/paldo/sources/$pkgname/$pkgname-$pkgver")
md5sums=('07f64fa3dae6eb8b1b578d01473a5c07')

package() {
  install -D -m 0755 $srcdir/$pkgname-$pkgver $pkgdir/usr/bin/rpm2cpio.pl
  install -d     $pkgdir/usr/share/licenses/$pkgname
  echo "For the license look into the script itself." > \
    $pkgdir/usr/share/licenses/$pkgname/license 
}
