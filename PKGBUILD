#Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=yokadi
pkgver=1.1.0
pkgrel=1
pkgdesc="Not your grandma TODO list"
url="http://yokadi.github.io"
arch=('any')
depends=('python-sqlalchemy' 'python-dateutil' 'hicolor-icon-theme')
optdepends=('python-crypto: encrypt tasks title and description')
source=("$url/download/$pkgname-$pkgver.tar.bz2")
license=('GPL3')
md5sums=('99831882c907b48f1ac1f59c29736219')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
