# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=python-sexpdata
pkgver=0.0.3
pkgrel=1
pkgdesc="S-expression parser for Python"
arch=('any')
url="https://github.com/tkf/sexpdata"
license=('BSD')
depends=('python')
source=("http://pypi.python.org/packages/source/s/sexpdata/sexpdata-${pkgver}.tar.gz")
md5sums=('de9c2c3ee28551e766cb535c0b2cebf0')

package() {
  cd "$srcdir/sexpdata-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
