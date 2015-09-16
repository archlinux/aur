# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=python-bottle-cork
pkgver=0.12.0a2
pkgrel=1
pkgdesc="Simple Authentication/Authorization libraryfor the Bottle and Flask web frameworks."
arch=(any)
url="http://cork.firelet.net/"
license=("LGPL")
depends=("python-bottle")
optdepends=("python-sqlalchemy: For MySQL, MariaDB and PostgreSQL backends"
            "python-pymongo: For mongoDB backend")
source=("https://pypi.python.org/packages/source/b/bottle-cork/bottle-cork-0.12.0a2.tar.gz")
md5sums=('abe867446f7762ce1cf4224943e3a250')

package() {
  cd "${srcdir}/bottle-cork-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}

