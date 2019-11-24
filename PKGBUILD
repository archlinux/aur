pkgname=python-tableutil
pkgver=2.4.2
pkgrel=1
pkgdesc="A collection of table creation utilities"
arch=(any)
url="https://bitbucket.org/daycoder/tableutil"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/t/tableutil/tableutil-$pkgver.tar.gz")
sha512sums=('SKIP')

package() {
  cd tableutil-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}
