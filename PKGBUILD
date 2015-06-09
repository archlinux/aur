# Maintainer: Grégoire Payen de La Garanderie <arch at hochet.info>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=pwman3
pkgver=0.6
pkgrel=2
pkgdesc="A console based password management application written in Python"
arch=('any')
url="https://github.com/pwman3/pwman3"
license=('GPL')
depends=('python-colorama' 'python-crypto' 'python-psycopg2' 'xsel')
optdepends=('python-pymysql: MySQL support')
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('bb37eeab3d29654008a6a6b123ab45eb59f2fff48572ed3f188e16ddee0d1da2')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}

