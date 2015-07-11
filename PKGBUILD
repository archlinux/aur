# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.7.1
pkgrel=1
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'python-crypto' 'xsel')
optdepends=('python-psycopg2: PostgreSQL support', 'python-pymysql: MySQL support', 'python-pymongo: MongoDB support')
source=(https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('74decb2c0451785ecaec388eb499298eab679ca9212836b8f1f28c3809ea9efe')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}

