# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.11.1
pkgrel=1
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'xsel' 'python-cryptography')
optdepends=('python-psycopg2: PostgreSQL support', 'python-pymysql: MySQL support', 'python-pymongo: MongoDB support')
source=(https://files.pythonhosted.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('3b0c0e30481c1117c6687e02de280e337c884a4ff8117c2e8556252e1754d356')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}

