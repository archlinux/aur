# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.9.1
pkgrel=1
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'xsel' 'python-cryptography')
optdepends=('python-psycopg2: PostgreSQL support', 'python-pymysql: MySQL support', 'python-pymongo: MongoDB support')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('92b6c11e71d28365a1b58ac6965aa106e3d54f1f2cb6ba1b9d7bfc3bb848c476')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}

