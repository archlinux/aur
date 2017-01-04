#Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=yokadi
pkgver=1.1.1
pkgrel=1
pkgdesc="Not your grandma TODO list"
url="http://yokadi.github.io"
arch=('any')
depends=('python-sqlalchemy' 'python-dateutil' 'hicolor-icon-theme')
optdepends=('python-crypto: encrypt tasks title and description')
source=("$url/download/$pkgname-$pkgver.tar.bz2")
license=('GPL3')
md5sums=('88d6f7de149e5de900706bf4814e7ef8')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
