# Contributor: Felix Hanley <felix@seconddrawer.com.au>

pkgname=python2-dictdlib
_libname=dictdlib
pkgver=2.0.4.1
_libver=2.0.4
pkgrel=1
pkgdesc="Python library for generating dictd dictionaries"
arch=(any)
url="http://packages.qa.debian.org/d/dictdlib.html"
license=('GPL2')
depends=('python2')
options=(!emptydirs)
source=("http://ftp.debian.org/debian/pool/main/d/dictdlib/dictdlib_$pkgver.tar.gz")
md5sums=('4efbf499c7fc7a2c25ef063a3a349e74')

package() {
  cd $srcdir/$_libname-$_libver
  python setup.py install --root=$pkgdir
}

