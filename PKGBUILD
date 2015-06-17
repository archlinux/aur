# Maintainer: M0Rf30

pkgname=python2-pysqlcipher
pkgver=2.6.4
pkgrel=1
pkgdesc="Python interface to SQLCipher"
arch=(any)
url="http://github.com/leapcode/pysqlcipher/"
license=('ZLIB')
depends=(python2 sqlcipher)
makedeps=(wget)
source=(https://pypi.python.org/packages/source/p/pysqlcipher/pysqlcipher-${pkgver}.tar.gz)


package(){
  cd $srcdir/pysqlcipher-${pkgver}

  python2 setup.py install --root="$pkgdir"
}

md5sums=('d0d03064ee657dca58abdc7860277939')
