# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.12.2
pkgrel=1
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'xsel' 'python-cryptography')
optdepends=('python-psycopg2: PostgreSQL support', 'python-pymysql: MySQL support', 'python-pymongo: MongoDB support')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('ef85e0da15a11a19b9cfdff81d5cd4ff7d5d8e940afe0a3ceed1f8295c1f00dc')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}

