pkgname=catstalker
pkgver=0.0.1
pkgrel=1
pkgdesc="Python library for energenie remote board access on a Raspberry Pi"
arch=('any')
url="http://github.com/ohjames/catstalker"
license=('MIT')
depends=('python' 'python-raspberry-gpio')
source=(http://pypi.python.org/packages/source/C/CatStalker/CatStalker-$pkgver.tar.gz)
md5sums=('0713465b9cd393b450f5020d6641c3fc')

package() {
  cd $srcdir/CatStalker-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
