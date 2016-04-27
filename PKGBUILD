#Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=yokadi
pkgver=1.0.2
pkgrel=2
pkgdesc="Not your grandma TODO list"
url="http://yokadi.github.io"
arch=('any')
depends=('python-sqlalchemy' 'python-dateutil' 'hicolor-icon-theme')
optdepends=('python-crypto: encrypt tasks title and description')
source=("$url/download/$pkgname-$pkgver.tar.bz2")
license=('GPL3')
md5sums=('bff00a7ff8bc6e28079e339e42832bbf')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}