#Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=yokadi
pkgver=1.2.0
pkgrel=2
pkgdesc="Command line oriented, sqlite powered, todo list"
url="https://yokadi.github.io"
arch=('any')
depends=('python-sqlalchemy' 'python-dateutil' 'hicolor-icon-theme')
optdepends=('python-pycryptodome: encrypt tasks title and description')
source=("$url/download/$pkgname-$pkgver.tar.gz")
license=('GPL3')
md5sums=('dc986bd76dd7f10fa8d4bd3faa38aac1')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
