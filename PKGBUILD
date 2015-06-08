# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>
pkgname=python-cx_oracle
pkgver=5.1.3
pkgrel=2
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url=('http://cx-oracle.sourceforge.net/')
license=('Python')
depends=('python' 'oracle-instantclient-sdk')
source=("https://pypi.python.org/packages/source/c/cx_Oracle/cx_Oracle-$pkgver.tar.gz")
md5sums=('cd6ff16559cbc9c20087ec812c7092ab')

package() {
  cd $srcdir/cx_Oracle-$pkgver
  python setup.py install --root=$pkgdir || return 1
  # license file is missing
}
