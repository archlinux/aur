# Maintainer: M0Rf30

pkgname=python2-pysqlcipher
pkgver=2.6.7
pkgrel=1
pkgdesc="Python interface to SQLCipher"
arch=(any)
url="http://github.com/leapcode/pysqlcipher/"
license=('ZLIB')
depends=(python2 sqlcipher)
source=("https://github.com/leapcode/pysqlcipher/archive/${pkgver}.tar.gz")


package(){
  cd $srcdir/pysqlcipher-${pkgver}

  python2 setup.py install --root="$pkgdir"
}
md5sums=('e8c6904a369b2287e240f5fd1d7eb5b0')
