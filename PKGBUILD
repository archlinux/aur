# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=python2-backports.csv
pkgver=1.0.6
pkgrel=1
pkgdesc="Backport of Python 3 csv module"
arch=('any')
url="https://github.com/ryanhiebert/backports.csv"
license=('Python')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ryanhiebert/backports.csv/archive/${pkgver}.tar.gz")
md5sums=('bfd394e05017f15b335facc4fd9b2b59')

package() {
  cd "backports.csv-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
