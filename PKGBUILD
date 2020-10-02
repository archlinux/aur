# Maintainer: Pedro Lucas Porcellis <porcellis@eletrotupi.com>

pkgname=python-bottle-sqlite
pkgver=0.1.3
pkgrel=0
pkgdesc="SQLite3 integration for Bottle"
arch=(any)
url="https://pypi.org/project/bottle-sqlite"
license=("MIT")
depends=("python-bottle")
source=("https://pypi.python.org/packages/source/b/bottle-sqlite/bottle-sqlite-${pkgver}.tar.gz")
md5sums=('6194e8e6f2472482f9d617c7e6173ed7')

package() {
  cd "${srcdir}/bottle-sqlite-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}

