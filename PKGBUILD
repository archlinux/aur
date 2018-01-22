# Maintainer: robertfoster

pkgname=python2-pysqlcipher
pkgver=2.6.9.1
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
md5sums=('502c1543199f53c561a9d649abc1fb77')
